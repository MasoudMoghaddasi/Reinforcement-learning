function [ V ] = Temporal_difference_landa_copy( horizontal , vertical , start_i , start_j , goal_i , goal_j , gamma , epsilon , landa , alpha , ep , trace )
V = zeros( 8 , 8 ) ;
r = -1 ;
PI_X = [1 2 2 2 2 3 3 3 4 5 6 6 6 6 5 5 5 4 4 4 4 5 6 7 7 7 7 7 8 8 8] ;
PI_Y = [8 8 7 6 5 5 4 3 3 3 3 4 5 6 6 5 4 4 5 6 7 7 7 7 6 5 4 3 3 2 1] ;
PI_a = [3 1 1 1 3 1 1 3 2 2 2 3 3 4 1 1 3 2 2 2 4 3 3 1 1 1 1 1 1 1 0] ;
for k = 1 : ep
    %% Initializing Z , S
    Z = zeros(8,8) ;
    Xagent = PI_X(1) ;
    Yagent = PI_Y(1) ;
    for q = 1 : 30
        %% S_prim selection
        Xagent_prim=PI_X(q+1);
        Yagent_prim=PI_Y(q+1);
        %% Temporal Difference Algorithm
        delta = r + gamma * V( Yagent_prim , Xagent_prim ) - V( Yagent , Xagent ) ;
        if trace == 1
            Z( Yagent , Xagent ) = Z( Yagent , Xagent ) + 1 ;
        else
            Z( Yagent , Xagent ) = 1 ;
        end
        V = V + alpha * delta * Z ;
        Z = gamma * landa * Z ;
        %% S <- S'
        Yagent = Yagent_prim ;
        Xagent = Xagent_prim ;
    end
end

end

