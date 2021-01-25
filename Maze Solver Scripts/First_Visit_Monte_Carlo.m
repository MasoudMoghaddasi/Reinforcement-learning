clc;clear;close all;

horizontal = [ 2 2 2 2 3 3 7 7 ; 3 3 3 3 4 4 8 8 ; 3 4 5 6 4 5 1 8 ] ;
vertical = [ 3 4 4 5 5 6 5 4 4 3 ; 2 2 3 3 4 4 5 5 6 6 ; 3 3 4 4 5 5 6 6 7 7 ] ;

start_i = 8 ;
start_j = 1 ;
goal_i = 1 ;
goal_j = 8 ;
gamma = 0.97 ;
it= 100;

r = -1 ;
%% Initializing Q arbitrarily
V = zeros( 8 , 8 ) ;
%% Initializing Return Empty
Return=cell( 8 , 8 ) ;
%% Initializing PI arbitrarily
PI_X = [1 2 2 2 2 3 3 3 4 5 6 6 6 6 5 5 5 4 4 4 4 5 6 7 7 7 7 7 8 8 8] ;
PI_Y = [8 8 7 6 5 5 4 3 3 3 3 4 5 6 6 5 4 4 5 6 7 7 7 7 6 5 4 3 3 2 1] ;
for Iteration = 1 : it
    Iteration
    for s = 1 : length(PI_X)-1
        if s == 1 
            Return{ PI_Y(s) , PI_X(s) }(end+1) = ( -1 + gamma^(length(PI_X(s:end-1))+1))/(1-gamma) ;
        else
            if ~( ( PI_X(s) == PI_X( 1 : s - 1 ) ) & ( PI_Y(s) == PI_Y( 1 : s - 1 ) ) )
                Return{ PI_Y(s) , PI_X(s) }(end+1) = ( -1 + gamma^(length(PI_X(s:end-1))+1))/(1-gamma) ;
            end
        end
    end
    for xi = 1 : 8
        for yi = 1 : 8
            if ~isempty( Return{ yi , xi } )
                V( yi , xi ) = mean( Return{ yi , xi } ) ;
            end
        end
    end  
end