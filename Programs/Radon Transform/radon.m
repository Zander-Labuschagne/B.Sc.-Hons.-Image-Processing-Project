# Created by Octave 4.2.1, Thu Jul 13 17:19:56 2017 SAST <zander@ArchLinux>
pkg load image;

c = imread('PTDC0012.JPG');
#cf = fftshift(fft2(c));
#cr = radon(c);

#figure;
#imshow(cr);
#figure;
#imshow(cf);

#c = binary image
e = edge(c, 'canny');
angles = 0:179;
[rad, x] = radon(e, angles);

imagesc(angles, x, rad), colormap(gray(256));

[r,theta] = find(rad==max(rad(:)));