# Anaglifos 3D con R
# www.overfitting.net
# https://www.overfitting.net/2018/05/anaglifos-3d-con-r.html

library(png)
Gamma=2  # Compensación gamma canal R (1=sin compensación)


# Leemos imágenes izquierda y derecha
izq=readPNG("izq.png")
der=readPNG("der.png")

# Anaglifo color
anaglyph=izq^(1/Gamma)
anaglyph[,,2:3]=der[,,2:3]
writePNG(anaglyph, "anaglifocolor.png")

# Anaglifo monocromo
lumizq=0.299*izq[,,1]+0.587*izq[,,2]+0.114*izq[,,3]  # Modelo
lumder=0.299*der[,,1]+0.587*der[,,2]+0.114*der[,,3]  # de luminosidad

anaglyph=izq
anaglyph[,,1]=lumizq^(1/Gamma)
anaglyph[,,2]=lumder
anaglyph[,,3]=lumder
writePNG(anaglyph, "anaglifomonocromo.png")
