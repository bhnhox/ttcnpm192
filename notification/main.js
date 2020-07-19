var cookie = require('cookie');

var io;

module.exports = {
    io: io,
    init: (server) => {
        io = require('socket.io')(server);
        io.on('connection', socket => {
            var cookies = cookie.parse(socket.handshake.headers.cookie);
            JSONCookieToObj(cookies);
            console.log(cookies);
            var role = cookies.info ? cookies.info.role : '';
            if (role == "nhanvien" || role == "vendor" || role == "daubep"){
                socket.join(cookies.info.vendor);
            }
            if (cookies.info) socket.join(cookies.info.username);
            socket.on('xac nhan', ()=>{
                console.log('xac nhan do an xong');
            })
            
            socket.on('disconnect',(data)=>{
                console.log(socket.id,data);
            });
        });
    },
    notiBookFood: (data)=>{
        io.in(data.vendor).emit('book food',data);
    },
    notiFoodReady: (data)=>{
        io.in(data.username).emit('food ready', {
            noti_content: 'Đồ ăn của bạn đã chuẩn bị xong',
            idgiohang: data.idgiohang
        });
    },
    notiFoodReadyNV: (data)=>{
        io.in(data.vendor).emit('food ready nv', data);
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
