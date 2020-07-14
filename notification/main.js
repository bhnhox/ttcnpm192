var cookie = require('cookie');

var io;

module.exports = {
    init: (server) => {
        io = require('socket.io')(server);
        io.on('connection', socket => {
            var cookies = cookie.parse(socket.handshake.headers.cookie);
            JSONCookieToObj(cookies);
            console.log(cookies);
            var role = cookies.role;
            if (role == "thungan" || role == "vendor" || role == "daubep"){
                socket.join(cookies.vender)
            }
            socket.on('disconnect',(data)=>{
                console.log(socket.id,data);
            });
        });
    }
}


function JSONCookieToObj(cookies) {
    Object.keys(cookies).forEach(key => {
        if (typeof cookies[key] === "string") {
            var rs = cookies[key].match('j:(.*)');
            if (rs) {
                cookies[key] = JSON.parse(rs[1]);
                JSONCookieToObj(cookies[key]);
            }
        }

    })
}
