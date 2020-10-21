FROM node

RUN git clone https://github.com/frankjoshua/jviz.git

WORKDIR /jviz

RUN npm install
RUN npm run build
RUN npm install -g serve

RUN apt-get update && apt-get install -y \
  curl \
  && rm -rf /var/lib/apt/lists/*

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD curl --fail \\
  http://localhost:3000 || exit 1

# CMD ["serve", "-s", "build", "-l", "3000"]
CMD ["npm", "start"]