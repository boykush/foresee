package server

import (
	"context"

	transactionv1 "github.com/boykush/foresee/services/transaction/gen/go"
)

// Server implements the TransactionServiceServer interface
type Server struct {
	transactionv1.UnimplementedTransactionServiceServer
}

// NewServer creates a new instance of the transaction service server
func NewServer() *Server {
	return &Server{}
}

// HealthCheck implements the health check endpoint
func (s *Server) HealthCheck(ctx context.Context, req *transactionv1.HealthCheckRequest) (*transactionv1.HealthCheckResponse, error) {
	return &transactionv1.HealthCheckResponse{
		Status: transactionv1.HealthCheckResponse_SERVING,
	}, nil
}
