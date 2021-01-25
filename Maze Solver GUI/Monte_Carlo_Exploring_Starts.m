function [ Q ] = Monte_Carlo_Exploring_Starts( horizontal , vertical , goal_i , goal_j , gamma , epsilon , it )
    r = -1 ;
    %% Initializing Q arbitrarily
    Q = zeros( 8 , 8 , 4 ) ;
    V = zeros( 8 , 8 ) ;
    %% Initializing Return Empty
    Return=cell( 8 , 8 , 4 ) ;
    PI = [2 3 2 2 2 2 2 4;
          2 1 3 3 3 3 3 1;
          2 1 3 3 3 2 3 1;
          2 1 2 3 3 2 3 1;
          2 1 2 2 2 2 3 1;
          2 1 2 2 2 3 3 1;
          3 1 2 2 2 2 2 1;
          3 1 4 4 4 4 4 4];
    for Iteration = 1 : it
        Iteration
        %% Generating Trace Using Policy
        PI_X = randi(8) ;
        PI_Y = randi(8) ;
        PI_a = [] ;
        while ( PI_X(end) ~= goal_j || PI_Y(end) ~= goal_i )
            %% S<-Current State
            Xagent = PI_X(end) ;
            Yagent = PI_Y(end) ;
            %% Selecting A with E-greedy Algorithm
            a_star = PI( Yagent , Xagent , : ) ;
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
            %% PI<-S'
            PI_X(end+1) = Xagent_prim ;
            PI_Y(end+1) = Yagent_prim ;
            PI_a(end+1) = a_star ;
        end
        
        for s = 1 : size(PI_a,2)
            if s == 1
                Return{ PI_Y(s) , PI_X(s) , PI_a(s) }(end+1) = ( -1 + gamma^(length(PI_a(s:end))+1))/(1-gamma) ;
            else
                if ~( ( PI_X(s) == PI_X( 1 : s - 1 ) ) & ( PI_Y(s) == PI_Y( 1 : s - 1 ) ) & ( PI_a(s) == PI_a( 1 : s - 1 ) ) )
                    Return{ PI_Y(s) , PI_X(s) , PI_a(s) }(end+1) = ( -1 + gamma^(length(PI_a(s:end))+1))/(1-gamma) ;
                end
            end
        end
        for xi = 1 : 8
            for yi = 1 : 8
                for ai = 1 : 4
                    if ~isempty( Return{ yi , xi , ai } )
                        Q( yi , xi , ai ) = mean( Return{ yi , xi , ai } ) ;
                    end
                end
            end
        end
        for xi = 1 : 8
            for yi = 1 : 8
                if ~isempty( Return{ yi , xi , 1 } ) ||~isempty( Return{ yi , xi , 2 } )||~isempty( Return{ yi , xi , 3 } )||~isempty( Return{ yi , xi , 4 } )
                   [V(yi , xi ) ,PI( yi , xi )] = max( Q( yi , xi , : ) ) ;
                end
            end
        end
    end
V
end

