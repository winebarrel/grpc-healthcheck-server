package main

import (
	"log"
	"net"
	"os"

	"google.golang.org/grpc"
	"google.golang.org/grpc/health"
	pb "google.golang.org/grpc/health/grpc_health_v1"
	"google.golang.org/grpc/reflection"
)

const (
	DefaultPort = "50051"
)

func main() {
	port, ok := os.LookupEnv("PORT")

	if !ok {
		port = DefaultPort
	}

	lis, err := net.Listen("tcp", ":"+port)

	if err != nil {
		log.Fatal(err)
	}

	svr := grpc.NewServer()
	pb.RegisterHealthServer(svr, health.NewServer())
	reflection.Register(svr)
	err = svr.Serve(lis)

	if err != nil {
		log.Fatal(err)
	}
}
