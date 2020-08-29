FROM node

RUN git clone https://github.com/frankjoshua/jviz.git

WORKDIR /jviz

RUN npm install
RUN npm build
RUN npm install -g serve

CMD ["serve", "-s", "build", "-l", "3000"]