function [nextX, nextY, th] = nextPos(next_pos, curX, curY)


%% Creating a list of 8-connected cells around the Current Robot position
%{
        8        1        2 
    |-------|--------|-------|
    |(-1,+1)| (0,+1) |(+1,+1)|
    |-------|--------|-------|
 7  |(-1,0) |   0    |(+1,0) |  3
    |-------|--------|-------|
    |(-1,-1)| (0,-1) |(+1,-1)|  
    |-------|--------|-------|
        6        5       4
%}

switch next_pos
    case 1
        nextX = curX + 0;
        nextY = curY + 1;
        th = 90;
        
    case 2
        nextX = curX + 1;
        nextY = curY + 1;
        th = 45;

    case 3
        nextX = curX + 1;
        nextY = curY + 0;
        th = 0;
        
    case 4
        nextX = curX + 1;
        nextY = curY - 1;
        th = 315;
        
    case 5
        nextX = curX + 0;
        nextY = curY - 1;
        th = 270;
        
    case 6
        nextX = curX - 1;
        nextY = curY - 1;
        th = 225;
        
    case 7
        nextX = curX - 1;
        nextY = curY + 0;
        th = 180;
       
    case 8
        nextX = curX - 1;
        nextY = curY + 1;
        th = 135;
       
end        
        
  %map(nextX, nextY) = 1; 
   %     map(curX, curY) = 3;    
    %    curX = nextX;
     %   curY = nextY;

end