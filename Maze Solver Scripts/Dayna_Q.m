clc;clear;close all;

horizontal = [ 2 2 2 2 3 3 7 7 ; 3 3 3 3 4 4 8 8 ; 3 4 5 6 4 5 1 8 ] ;
vertical = [ 3 4 4 5 5 6 5 4 4 3 ; 2 2 3 3 4 4 5 5 6 6 ; 3 3 4 4 5 5 6 6 7 7 ] ;

start_i = 8 ;
start_j = 1 ;
goal_i = 1 ;
goal_j = 8 ;



ep = 1000 ;
gamma = 0.97 ;
epsilon = 0.3 ;
alpha = 0.8 ;
n = 10 ;


r = -1 ;
S = cell( 1 , 256 ) ;
counter = 1 ;
Q = zeros( 8 , 8 , 4 ) ;
Model = cell( 8 , 8 , 4 ) ;
for k = 1 : ep
    %% Initializing S
    Xagent_prim = start_j ;
    Yagent_prim = start_i ;
    q=1;
    clear X Y
    while ( Xagent_prim ~= goal_j || Yagent_prim ~= goal_i )
        X(q) = Xagent_prim ;
        Y(q) = Yagent_prim ;
        q=q+1;
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