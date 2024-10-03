######################
#### BUILD PHASE #####
######################
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

# build folder will be created inside /app/build
RUN npm run build


####################
#### RUN PHASE #####
####################
FROM nginx

# this path from nginx docs
COPY --from=builder /app/build /usr/share/nginx/html
