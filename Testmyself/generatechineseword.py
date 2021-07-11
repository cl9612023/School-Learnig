from PIL import ImageFont, Image, ImageDraw
import numpy as np
import cv2
import matplotlib.pyplot as plt
#字體檔
ttf_path = 'C:/Windows/Fonts/kaiu.ttf'
#大小(盡量是正方形跟text_w進似)
text_size = 64
#字體文件
font = ImageFont.truetype(ttf_path, text_size)
#字體大小
text_w,text_h =font.getsize('一二三四')
#生成新的图像(#moede，[長寬]，color(RGB))基底
canvas=Image.new('RGB',[text_w,text_h],(255,255,255))
#繪圖的物件
draw=ImageDraw.Draw(canvas)
#顏色
white = '#000000'
#內容文字
draw.text((0,0),'一二三四',font=font,fill=white)
#展示(PIL展示)
#canvas.show()

imagesize = canvas.size
array = np.array(canvas)
plt.imshow(array,cmap="gray")
plt.show()
