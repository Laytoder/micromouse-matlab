classdef Ev3Connectivity
    methods (Static)
        function brick = connectToEv3(brickName)
            brick = ConnectBrick(brickName); % Connecting to the brick
            brick.playTone(100, 800, 500); % Playing a tone to ensure connection
            % Logging the Successful Connection notification.
            fprintf('Connection to EV3 Brick %s successfull!\n', brickName);
            % Logging the Current Battery Voltage
            fprintf('The battery is charged %s\n', brick.GetBattLevel());
        end
        
        function disconnectEv3(brickName)
            DisconnectBrick(brickName);
            % Logging the Successfully Disconnecting notification.
            fprintf('Successfully disconnected from %s EV3 brick', brickName);
        end
    end
end