function [ Q ] = Dyna_Q( horizontal , vertical , start_i , start_j , goal_i , goal_j , gamma , epsilon , n , alpha , ep )
    r = -1 ;
    S = cell( 1 , 256 ) ;
    counter = 1 ;
    Q = zeros( 8 , 8 , 4 ) ;
    V = zeros( 8 , 8 ) ;
    Model = cell( 8 , 8 , 4 ) ;
    for Episode = 1 : ep
        Episode
        %% Initializing S
        Xagent_prim = start_j ;
        Yagent_prim = start_i ;
        while ( Xagent_prim ~= goal_j || Yagent_prim ~= goal_i )
            %% S<-Current State
            Xagent = Xagent_prim ;
            Yagent = Yagent_prim ;
            %% Selecting A with E-greedy Algorithm
            [~ , a_star] = max( Q( Xagent , Yagent , : ) ) ;
            if rand <= epsilon
                a = a_star;
                while (a==a_star)
                    a = ceil( rand * 4 ) ;
                end
                a_star = a ;
            end
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
            flag = 0 ;
            if counter ~= 1 
                for i = 1 : counter - 1
                    if S{i} == [ Yagent Xagent a_star ] 
                        flag = 1 ;
                    end
                end
            end
            if flag == 0 
                S{ counter } = [ Yagent Xagent a_star ] ;
                counter = counter + 1 ;
            end
            %% Q Algorithm
            Q( Yagent , Xagent , a_star ) = Q( Yagent , Xagent , a_star ) + ...
                alpha * [ r + gamma * max( Q( Yagent_prim , Xagent_prim , : ) ) - Q( Yagent , Xagent , a_star ) ] ;
            Model{ Yagent , Xagent , a_star } = [ r , Yagent_prim , Xagent_prim ] ;
            for i = 1 : n
                SA = S { randi( counter - 1 ) } ;
                RS_prim = Model{ SA(1) , SA(2) , SA(3) } ; 
                Q( SA(1) , SA(2) , SA(3) ) = Q( SA(1) , SA(2) , SA(3) ) + ...
                    alpha * [ RS_prim( 1 ) + gamma * max( Q( RS_prim( 2 ) , RS_prim( 3 ) , : ) ) - Q( SA(1) , SA(2) , SA(3) ) ] ;
            end
        end
    end
    for xi = 1 : 8
        for yi = 1 : 8
           [V(yi , xi ) ,~] = max( Q( yi , xi , : ) ) ;
        end
    end
    V

end

