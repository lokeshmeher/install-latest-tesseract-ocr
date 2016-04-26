# Install dependencies:
sudo apt-get install libpng-dev libjpeg-dev libtiff-dev zlib1g-dev
sudo apt-get install gcc g++
sudo apt-get install autoconf automake libtool checkinstall

# Download dependencies for training tools (recommended):
sudo apt-get install libicu-dev      # (if you plan to make the training tools)
sudo apt-get install libpango1.0-dev # (if you plan to make the training tools)
sudo apt-get install libcairo2-dev   # (if you plan to make the training tools)

# Download and install latest version of Leptonica:
wget http://www.leptonica.org/source/leptonica-1.73.tar.gz
tar -zxvf leptonica-1.73.tar.gz
cd leptonica-1.73
./configure
make
sudo checkinstall
sudo ldconfig
cd ..

# Download and extract latest source of tesseract from github:
wget https://github.com/tesseract-ocr/tesseract/archive/3.04.01.tar.gz	# (for e.g.)
tar -zxvf tesseract-3.04.01.tar.gz

# Download training data for english:
mkdir tessdata
cd tessdata
wget https://github.com/tesseract-ocr/tessdata/blob/master/eng.cube.bigrams
wget https://github.com/tesseract-ocr/tessdata/blob/master/eng.cube.fold
wget https://github.com/tesseract-ocr/tessdata/blob/master/eng.cube.lm
wget https://github.com/tesseract-ocr/tessdata/blob/master/eng.cube.nn
wget https://github.com/tesseract-ocr/tessdata/blob/master/eng.cube.params
wget https://github.com/tesseract-ocr/tessdata/blob/master/eng.cube.size
wget https://github.com/tesseract-ocr/tessdata/blob/master/eng.cube.word-freq
wget https://github.com/tesseract-ocr/tessdata/blob/master/eng.tesseract_cube.nn
wget https://github.com/tesseract-ocr/tessdata/blob/master/eng.tesseract_cube.nn
wget https://github.com/tesseract-ocr/tessdata/blob/master/eng.traineddata
cd ..

# Move the downloaded training data to the tessdata sub-folder of the extracted tesseract folder
mv tessdata/* tesseract-3.04.01/tessdata/


# Finally, install tesseract
cd tesseract-3.04.01
./autogen.sh
./configure
make
sudo make install LANG="eng"
sudo ldconfig
cd ..

# Just one more thing:
mv tesseract-3.04.01/tessdata/* /usr/local/share/tessdata/
	# if asked for overriding mode to overwrite: enter 0755 (rwxr-xr-x)

# References:
# https://github.com/tesseract-ocr/tesseract/wiki/Compiling
# http://hanzratech.in/2015/01/16/ocr-using-tesseract-on-ubuntu-14-04.html
# http://superuser.com/questions/758876/tesseract-3-03-english-language-data
# http://www.leptonica.org/source/README.html
