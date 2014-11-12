/**
 * Created by frank on 11/6/14.
 */

var Game = {};

Game.fps = 60;

Game.initialize = function() {
    init_canvas();
    add_event_listener_mousedown(event_listener_mousedown);
    add_event_listener_mouseup(event_listener_mouseup);
    add_event_listener_mousemove(event_listener_mousemove);
    add_event_listener_keyboard(event_listener_keyboard);
    init_board();
    init_pieces();
    draw_board();
};



Game.draw = function() {
    //First clear rect
    context.clearRect(0, 0, elem.width, elem.height);


    //Draw the board
    if (REINIT_BOARD)
    {
        //Board has switched colors, re-init the pieces
        init_board();
        REINIT_BOARD = false;
    }

    draw_board();

    for (var i=0; i < pieces.length; i++) {
        drawPiece(pieces[i]);
    }
};

Game.update = function() {

    for (var i=0; i < pieces.length; i++) {
        pieces[i].update();
    }
};

function site_ready() {
    Game.initialize();

    Game.run = (function() {
        var loops = 0, skipTicks = 1000 / Game.fps,
            maxFrameSkip = 10,
            nextGameTick = (new Date).getTime();

        return function() {
            loops = 0;

            while ((new Date).getTime() > nextGameTick) {
                updateStats.update();
                Game.update();
                nextGameTick += skipTicks;
                loops++;
            }

            renderStats.update();
            Game.draw();
        };
    })();

    window.setInterval(Game.run, 0);

}

$(document).ready(site_ready);

//Fixes turbo-link in rails
$(document).on('page:load', site_ready);
