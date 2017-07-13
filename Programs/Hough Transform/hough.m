# Created by Octave 4.2.1, Thu Jul 13 17:19:56 2017 SAST <zander@ArchLinux>
pkg load image;

#c = binary image;
e = edge(c, 'canny');

[x, y] = find(e==1);
th = 0:179;
cos_th = cosd(th);
sin_th = sind(th);
rtable = floor(x*cos_th + y*sin_th);
u = unique(rtbale);
N = length(u);

for j = 1 : 180
  for i = 1 : N;
    hough(i, j) = length(find(rtable(:,j)==u(i)));
  end;
end;
