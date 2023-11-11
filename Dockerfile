# Use an official Golang runtime as a parent image
FROM golang:latest

# Set the working directory inside the container
WORKDIR /go/src/app

# Copy the local package files to the container's workspace
COPY . .

# Download and install any needed dependencies
# (if any dependencies are used in your Go application)
RUN go get -d -v ./...

# Install the application
RUN go install -v ./...

# Set environment variables
ENV PATH="/go/bin:${PATH}"

# Set the default command to run when the container starts
CMD ["app"]
