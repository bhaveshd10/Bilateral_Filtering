# Bilateral_Filtering

An Egde preserving smoothening filter used for noise reduction in an image while preserving its edges.

Bilateral filter is a locally adaptive filter where the weights applied to each neighboring pixel are computed based on both the spatial distance (referred to as domainfiltering) and the tonal distance (referred to as rangefiltering) between the center pixel and the neighboring pixels.

Before

![Parrots](https://user-images.githubusercontent.com/50055930/102423452-0b989680-3fd7-11eb-90de-9645bb50b543.png)  

After

![Parrots_Noisy](https://user-images.githubusercontent.com/50055930/102423458-105d4a80-3fd7-11eb-8065-8857999e9629.png)
