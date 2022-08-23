""" Classes importantes para processamento de imagens """

import cv2
from typing import Tuple

import matplotlib.pyplot as plt
import numpy as np

from utils import *


class ImageTransformer:
    def __init__(self, img: np.array, color_fmt='bgr'):
        self.img = img
        self.color_fmt = color_fmt

    def bgr2rgb(img):
        return cv2.cvtColor(img, cv2.COLOR_BGR2RGB)

    def rgb2gray(img):
        return cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)

    def bgr2gray(img):
        return cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    def rotate(img, degrees: int, scale: float = 1.0):
        try:
            rows, cols = img.shape

        except:
            rows, cols, channels = img.shape
        M_graus = cv2.getRotationMatrix2D((cols/2, rows/2), degrees, scale)

        m_img = cv2.warpAffine(img, M_graus, (cols, rows))

        return m_img

    def shearing(img, cx: float = 0, cy: float = 0):
        try:
            rows, cols = img.shape

        except:
            rows, cols, channels = img.shape

        m = np.float32([
            [1, cx, 0],
            [cy, 1, 0]
        ])

        img_mod = cv2.warpAffine(img, m, (cols, rows))

        return img_mod

    def translate(img, tx: int = 0, ty: int = 0):
        try:
            rows, cols = img.shape
        except:
            rows, cols, channels = img.shape

        m = np.float32([
            [1, 0, tx],
            [0, 1, ty]
        ])

        img_mod = cv2.warpAffine(img, m, (cols, rows))

        return img_mod

    def resize(img, w, h):
        img = cv2.resize(img,
                        (w, h),
                        interpolation=cv2.INTER_AREA)
        
        return img

    def invert(img):
        inv = cv2.bitwise_not(img)
        return inv

    def equalize_histogram(img, color_fmt):
        if color_fmt in ['bgr', 'rgb']:
            if color_fmt == 'bgr':
                img_hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
            elif color_fmt == 'rgb':
                img_hsv = cv2.cvtColor(img, cv2.COLOR_RGB2HSV)
            img_hsv[:, :, 2] = cv2.equalizeHist(img_hsv[: , :, 2])

        if color_fmt == 'bgr':
            img = cv2.cvtColor(img_hsv, cv2.COLOR_HSV2BGR)
        elif color_fmt == 'rgb':
            img = cv2.cvtColor(img_hsv, cv2.COLOR_HSV2RGB)
        elif color_fmt == 'gray':
            img = cv2.equalizeHist(img)
        else:
            raise ValueError
        return img

    def clahe(img, color_fmt, clip_limit: float = 2, tile_size: Tuple[int] = (8,8)):
        """
        Contrast Limited Adaptive Histogram Equalization (CLAHE): 
        A equalização acontece localmente em pequenas regiões denominadas de tiles

        Parameters
        clipLimit - Threshold for contrast limiting.
        tileGridSize - Size of grid for histogram equalization. Input image will be 
        divided into equally sized rectangular tiles.
        """
        if color_fmt in ['bgr', 'rgb']:
            if color_fmt == 'bgr':
                img_lab = cv2.cvtColor(img, cv2.COLOR_BGR2LAB)
            elif color_fmt == 'rgb':
                img_lab = cv2.cvtColor(img, cv2.COLOR_RGB2LAB)
   
            img_channels = list(cv2.split(img_lab))
            clahe = cv2.createCLAHE(clipLimit=clip_limit, tileGridSize=tile_size)
   
            img_channels[0] = clahe.apply(img_channels[0])
            img = cv2.merge(img_channels)
            if color_fmt == 'bgr':
                img = cv2.cvtColor(img, cv2.COLOR_LAB2BGR)
            elif color_fmt == 'rgb':
                img = cv2.cvtColor(img, cv2.COLOR_LAB2RGB)
   
        elif color_fmt == 'gray':
            clahe = cv2.createCLAHE(clipLimit=clip_limit, tileGridSize=tile_size)
            img = clahe.apply(img)
        else:
            raise ValueError
        return img


    def visualize(original, augmented):
        if len(original) == 3:
            cmap_original = 'rgb'
        else:
            cmap_original = 'gray'

        if len(augmented) == 3:
            cmap_augmented = 'rgb'
        else:
            cmap_augmented = 'gray'

        fig = plt.figure()
        plt.subplot(1,2,1)
        plt.title('Original image')
        plt.axis('off')
        plt.imshow(original, cmap=cmap_original)

        plt.subplot(1,2,2)
        plt.title('Augmented image')
        plt.axis('off')
        plt.imshow(augmented, cmap=cmap_augmented)


    def convolve_padding_1channel(img: np.array, kernel: np.array, padding: bool = True) -> np.array:
        # Para simplificar
        k = kernel.shape[0]
        if padding:
            padding_len = k // 2
            img = np.pad(img,
                        ((padding_len, padding_len), (padding_len, padding_len)),
                        'constant'                    
                        )

        final_img_size = (img.shape[0]-k+1, img.shape[1]-k+1)
        
        rows, cols = img.shape
        
        # Criando um array bidimensional com o tamanho da imagem final
        final_img_size = (img.shape[0]-k+1, img.shape[1]-k+1)
        convolved_img = np.zeros(shape=final_img_size)
        
        # Iteração por linha
        for i in range(rows-k+1):
            # Iteração por coluna
            for j in range(cols-k+1):
                # img[i, j] = Valor do pixel
                # Pegue uma amostra da imagem
                mat = img[i:i+k, j:j+k]
                # Aplicando a convolução
                # Multiplicação por cada elemento e somando o resultado
                # Armazendo o valor na linha i e coluna j
                # Evitando pixels com valores negativos
                result = np.sum(np.multiply(mat, kernel))
                if result < 0:
                    result = 0
                # Limitando o valor do pixel para 255
                if result > 255:
                    result = 255
                # Evitando pixel com float utilizando int!
                convolved_img[i, j] = int(result)
                
        return convolved_img.astype('uint8') # Voltando a imagem em 8 bits
    
    def convolve_padding(img: np.array, kernel: np.array, padding: bool = True) -> np.array:
        if len(img.shape) == 3:
            channel_1, channel_2, channel_3 = cv2.split(img)
            channels = [channel_1, channel_2, channel_3]
        else:
            channel_1 = img.copy()
            channels = [channel_1]
        
        convolved_channels = []

        for i in channels:
            convolved_channels.append(ImageTransformer.convolve_padding_1channel(i, kernel, padding))

        return cv2.merge(convolved_channels)

    def edge_detection(img, color_fmt):
        if color_fmt == 'bgr':
            img_gray = ImageTransformer.bgr2gray(img)
        elif color_fmt == 'rgb':
            img_gray = ImageTransformer.rgb2gray(img)
        
        sobelxy = cv2.Sobel(src=img_gray,
                    ddepth=cv2.CV_8U, # 8bits
                    dx=1, # derivada de primeira ordem eixo x
                    dy=1, # derivada de primeira ordem eixo y
                    ksize=5 # tamanho do kernel (5x5)
            ) # Combined X and Y Sobel Edge Detection

        # ret, binary = cv2.threshold(sobelxy,50,255,cv2.THRESH_BINARY_INV)
        return sobelxy

    def hdr(img, color_fmt):
        """A imagem deve entrar em RGB """
        if color_fmt == 'bgr':
            img = ImageTransformer.bgr2rgb(img)
        # Utilizando o openCV para aumentar os detalhes da imagem
        hdr = cv2.detailEnhance(img, sigma_s=12, sigma_r=0.15)
        return  hdr