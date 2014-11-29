var bf = ">+++++++++[<++++++++>-]<.>+++++++[<++++>" +
         "-]<+.+++++++..+++.[-]>++++++++[<++++>-]<" +
         ".>+++++++++++[<+++++>-]<.>++++++++[<+++>" +
         "-]<.+++.------.--------.[-]>++++++++[<++" +
         "++>-]<+.[-]++++++++++.";

var jmp = new Uint32Array(bf.length + 1);
for (var i = 0, loops = []; i < bf.length; ++i) {
    switch (bf[i]) {
    case '[':
        loops.push(i);
        break;
    case ']':
        var start = loops.pop();
        jmp[start] = i;
        jmp[i] = start;
        break;
    }
}

var pc = 0, r = 0, m = new Uint8Array(30000);
while (pc < bf.length) {
    switch (bf[pc]) {
    case '+': ++m[r]; break;
    case '-': --m[r]; break;
    case '>': ++r; break;
    case '<': --r; break;
    case '.':
        process.stdout.write(String.fromCharCode(m[r]));
        break;
    case '[':
        if (m[r] == 0) pc = jmp[pc];
        break;
    case ']':
        if (m[r] != 0) pc = jmp[pc] - 1;
        break;
    }
    ++pc;
}
