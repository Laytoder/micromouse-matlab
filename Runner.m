% Connect to Ev3
if exist('brick', 'var') == 0
    brick = Ev3Connectivity.connectToEv3(Config.BRICK_NAME);
elseif isempty(brick)
    brick = Ev3Connectivity.connectToEv3(Config.BRICK_NAME);
end

% Navigate
NavigationHelper.navigate(brick);