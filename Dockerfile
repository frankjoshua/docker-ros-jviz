FROM node

RUN git clone https://github.com/frankjoshua/jviz.git

WORKDIR /jviz

RUN npm install
RUN npm run build
RUN npm install -g serve

# CMD ["serve", "-s", "build", "-l", "3000"]
CMD ["npm", "start"]