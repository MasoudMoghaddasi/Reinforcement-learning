function  [ Q ] = Sarsa_landa( horizontal , vertical , start_i , start_j , goal_i , goal_j , gamma , epsilon , landa , alpha , ep , trace )
    Q = -5*rand( 8 , 8 , 4 ) ;
    Q( 1 , 8 , : ) = 0 ;
    V=zeros( 8 , 8 ) ;
    r = -1 ;
    
    for Episode = 1 : ep
        Episode
        %% Initializing Z , S , A
        Z = zeros( 8 , 8 , 4 ) ;
        Xagent = start_j ;
        Yagent = start_i ;
        a_star = randi( 4 ) ;
        while ( Xagent ~= goal_j || Yagent ~= goal_i )
            %% S' selection
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
            %% Selecting A' with E-greedy Algorithm
            [~ , a_star_prim] = max( Q( Xagent_prim , Yagent_prim , : ) ) ;
            if rand <= epsilon
                a = a_star_prim;
                while (a==a_star_prim)
                    a = randi( 4 ) ;
                end
                a_star_prim = a ;
            end
            %% Sarsa Algorithm
            delta = r + gamma * Q( Yagent_prim , Xagent_prim , a_star_prim ) - Q( Yagent , Xagent , a_star ) ;
            if trace == 1
                Z( Yagent , Xagent , a_star ) = Z( Yagent , Xagent , a_star ) + 1 ;
            else
                Z( Yagent , Xagent , a_star ) = 1 ;
            end
            Q = Q + alpha * delta * Z ;
            Z = gamma * landa * Z ;
            %% S<-S' , A<-A'
            Xagent = Xagent_prim ;
            Yagent = Yagent_prim ;
            a_star = a_star_prim ;
        end
    end
    for xi = 1 : 8
        for yi = 1 : 8
           [V(yi , xi ) ,~] = max( Q( yi , xi , : ) ) ;
        end
    end
    V
end

