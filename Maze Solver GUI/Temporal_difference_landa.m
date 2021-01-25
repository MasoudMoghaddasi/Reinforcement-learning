function [ V ] = Temporal_difference_landa( horizontal , vertical , start_i , start_j , goal_i , goal_j , gamma , epsilon , landa , alpha , ep , trace )
    V = zeros( 8 , 8 ) ;
    r = -1 ;
    for Episode = 1 : ep
        Episode
        %% Initializing Z , S
        Z = zeros(8,8) ;
        Xagent = start_j ;
        Yagent = start_i ;
        while ( Xagent ~= goal_j || Yagent ~= goal_i )
            %% Choosing Action A Using E-greedy Policy
            v = [ -inf -inf -inf -inf ] ;
            if Yagent ~= 1  
                v(1) = V( Xagent , Yagent-1 ) ;
            end
            if Yagent ~= 8
                v(2) = V( Xagent , Yagent+1 ) ;
            end
            if Xagent ~= 8
                v(3) = V( Xagent+1 , Yagent ) ;
            end
            if Xagent ~= 1
                v(4) = V( Xagent-1 , Yagent ) ;
            end
            [~ , a_star] = max( v ) ;
            if rand <= epsilon
                a = a_star;
                while (a==a_star)
                    a = ceil( rand * 4 ) ;
                end
                a_star = a ;
            end
            %% S_prim selection
            % Obstacle
            flag = 0 ;
            for i = 1 : size( horizontal , 2 )
                if Xagent == horizontal(3,i) && Yagent == horizontal(1,i) && a_star == 2
                    flag = 1 ; 
                end
                if Xagent == horizontal(3,i) && Yagent == horizontal(2,i) && a_star == 1
                    flag = 1 ; 
                end
            end
            for i = 1 : size( vertical , 2 )
                if Xagent == vertical(2,i) && Yagent == vertical(1,i) && a_star == 3
                    flag = 1 ; 
                end
                if Xagent == vertical(3,i) && Yagent == vertical(1,i) && a_star == 4
                    flag = 1 ; 
                end
            end
            % Walls
            if ( Yagent == 1 && a_star == 1 ) || ( Yagent == 8 && a_star == 2 ) || ( Xagent == 8 && a_star == 3 ) || ( Xagent == 1 && a_star == 4 )
                flag = 1 ;
            end
            Yagent_prim = Yagent ;
            Xagent_prim = Xagent ;
            if flag == 0
                switch a_star
                    case 1
                        Yagent_prim=Yagent-1 ;
                    case 2
                        Yagent_prim=Yagent+1 ;
                    case 3
                        Xagent_prim=Xagent+1 ;
                    case 4
                        Xagent_prim=Xagent-1 ;
                end
            end
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

