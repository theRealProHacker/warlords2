; ovl55 stub 30a2 file_off 0x70bb0 size 0x2a6

ovl55_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  81ec8a00         sub sp, 0x8a                             
  0007  56               push si                                  
  0008  8b4606           mov ax, word ptr [bp + 6]                
  000b  0bc0             or ax, ax                                
  000d  740c             je 0x1b                                  
  000f  3d0100           cmp ax, 1                                
  0012  7433             je 0x47                                  
  0014  3d0200           cmp ax, 2                                
  0017  7418             je 0x31                                  
  0019  eb64             jmp 0x7f                                 
  001b  16               push ss                                  
  001c  8d8676ff         lea ax, [bp - 0x8a]                      
  0020  50               push ax                                  
  0021  16               push ss                                  
  0022  8d4696           lea ax, [bp - 0x6a]                      
  0025  50               push ax                                  
  0026  16               push ss                                  
  0027  8d46b6           lea ax, [bp - 0x4a]                      
  002a  50               push ax                                  
  002b  1e               push ds                                  
  002c  68141f           push 0x1f14                               ; "standard.pal"
  002f  eb46             jmp 0x77                                 
  0031  16               push ss                                  
  0032  8d8676ff         lea ax, [bp - 0x8a]                      
  0036  50               push ax                                  
  0037  16               push ss                                  
  0038  8d4696           lea ax, [bp - 0x6a]                      
  003b  50               push ax                                  
  003c  16               push ss                                  
  003d  8d46b6           lea ax, [bp - 0x4a]                      
  0040  50               push ax                                  
  0041  1e               push ds                                  
  0042  68211f           push 0x1f21                               ; "black.pal"
  0045  eb30             jmp 0x77                                 
  0047  b8042c           mov ax, 0x2c04                           
  004a  8ec0             mov es, ax                               
  004c  26ff366101       push word ptr es:[0x161]                 
  0051  1e               push ds                                  
  0052  682b1f           push 0x1f2b                               ; "terrain%d\war2.pal"
  0055  16               push ss                                  
  0056  8d46d6           lea ax, [bp - 0x2a]                      
  0059  50               push ax                                  
  005a  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  005f  83c40a           add sp, 0xa                              
  0062  16               push ss                                  
  0063  8d8676ff         lea ax, [bp - 0x8a]                      
  0067  50               push ax                                  
  0068  16               push ss                                  
  0069  8d4696           lea ax, [bp - 0x6a]                      
  006c  50               push ax                                  
  006d  16               push ss                                  
  006e  8d46b6           lea ax, [bp - 0x4a]                      
  0071  50               push ax                                  
  0072  16               push ss                                  
  0073  8d46d6           lea ax, [bp - 0x2a]                      
  0076  50               push ax                                  
  0077  90               nop                                      
  0078  0e               push cs                                  
  0079  e8ad01           call 0x229                               
  007c  83c410           add sp, 0x10                             
  007f  be1000           mov si, 0x10                             
  0082  e96101           jmp 0x1e6                                
  0085  83fe06           cmp si, 6                                
  0088  7573             jne 0xfd                                 
  008a  8bde             mov bx, si                               
  008c  d1e3             shl bx, 1                                
  008e  8d8676ff         lea ax, [bp - 0x8a]                      
  0092  03d8             add bx, ax                               
  0094  368b07           mov ax, word ptr ss:[bx]                 
  0097  8946fe           mov word ptr [bp - 2], ax                
  009a  cd3b             int 0x3b                                 
  009c  46               inc si                                   
  009d  fecd             dec ch                                   
  009f  3406             xor al, 6                                
  00a1  3e1f             pop ds                                   
  00a3  cd38             int 0x38                                 
  00a5  0e               push cs                                  
  00a6  42               inc dx                                   
  00a7  1f               pop ds                                   
  00a8  9a571b0000       lcall 0, 0x1b57                          -> 0000:1b57
  00ad  50               push ax                                  
  00ae  8bde             mov bx, si                               
  00b0  d1e3             shl bx, 1                                
  00b2  8d4696           lea ax, [bp - 0x6a]                      
  00b5  03d8             add bx, ax                               
  00b7  368b07           mov ax, word ptr ss:[bx]                 
  00ba  8946fe           mov word ptr [bp - 2], ax                
  00bd  cd3b             int 0x3b                                 
  00bf  46               inc si                                   
  00c0  fecd             dec ch                                   
  00c2  3406             xor al, 6                                
  00c4  3e1f             pop ds                                   
  00c6  cd38             int 0x38                                 
  00c8  0e               push cs                                  
  00c9  42               inc dx                                   
  00ca  1f               pop ds                                   
  00cb  9a571b0000       lcall 0, 0x1b57                          -> 0000:1b57
  00d0  50               push ax                                  
  00d1  8bde             mov bx, si                               
  00d3  d1e3             shl bx, 1                                
  00d5  8d46b6           lea ax, [bp - 0x4a]                      
  00d8  03d8             add bx, ax                               
  00da  368b07           mov ax, word ptr ss:[bx]                 
  00dd  8946fe           mov word ptr [bp - 2], ax                
  00e0  cd3b             int 0x3b                                 
  00e2  46               inc si                                   
  00e3  fecd             dec ch                                   
  00e5  3406             xor al, 6                                
  00e7  3e1f             pop ds                                   
  00e9  cd38             int 0x38                                 
  00eb  0e               push cs                                  
  00ec  42               inc dx                                   
  00ed  1f               pop ds                                   
  00ee  9a571b0000       lcall 0, 0x1b57                          -> 0000:1b57
  00f3  50               push ax                                  
  00f4  8bc6             mov ax, si                               
  00f6  050e00           add ax, 0xe                              
  00f9  50               push ax                                  
  00fa  e9e100           jmp 0x1de                                
  00fd  83fe07           cmp si, 7                                
  0100  7e71             jle 0x173                                
  0102  8bde             mov bx, si                               
  0104  d1e3             shl bx, 1                                
  0106  8d8676ff         lea ax, [bp - 0x8a]                      
  010a  03d8             add bx, ax                               
  010c  368b07           mov ax, word ptr ss:[bx]                 
  010f  8946fe           mov word ptr [bp - 2], ax                
  0112  cd3b             int 0x3b                                 
  0114  46               inc si                                   
  0115  fecd             dec ch                                   
  0117  3406             xor al, 6                                
  0119  3e1f             pop ds                                   
  011b  cd38             int 0x38                                 
  011d  0e               push cs                                  
  011e  42               inc dx                                   
  011f  1f               pop ds                                   
  0120  9a571b0000       lcall 0, 0x1b57                          -> 0000:1b57
  0125  50               push ax                                  
  0126  8bde             mov bx, si                               
  0128  d1e3             shl bx, 1                                
  012a  8d4696           lea ax, [bp - 0x6a]                      
  012d  03d8             add bx, ax                               
  012f  368b07           mov ax, word ptr ss:[bx]                 
  0132  8946fe           mov word ptr [bp - 2], ax                
  0135  cd3b             int 0x3b                                 
  0137  46               inc si                                   
  0138  fecd             dec ch                                   
  013a  3406             xor al, 6                                
  013c  3e1f             pop ds                                   
  013e  cd38             int 0x38                                 
  0140  0e               push cs                                  
  0141  42               inc dx                                   
  0142  1f               pop ds                                   
  0143  9a571b0000       lcall 0, 0x1b57                          -> 0000:1b57
  0148  50               push ax                                  
  0149  8bde             mov bx, si                               
  014b  d1e3             shl bx, 1                                
  014d  8d46b6           lea ax, [bp - 0x4a]                      
  0150  03d8             add bx, ax                               
  0152  368b07           mov ax, word ptr ss:[bx]                 
  0155  8946fe           mov word ptr [bp - 2], ax                
  0158  cd3b             int 0x3b                                 
  015a  46               inc si                                   
  015b  fecd             dec ch                                   
  015d  3406             xor al, 6                                
  015f  3e1f             pop ds                                   
  0161  cd38             int 0x38                                 
  0163  0e               push cs                                  
  0164  42               inc dx                                   
  0165  1f               pop ds                                   
  0166  9a571b0000       lcall 0, 0x1b57                          -> 0000:1b57
  016b  50               push ax                                  
  016c  8bc6             mov ax, si                               
  016e  053000           add ax, 0x30                             
  0171  eb86             jmp 0xf9                                 
  0173  8bde             mov bx, si                               
  0175  d1e3             shl bx, 1                                
  0177  8d8676ff         lea ax, [bp - 0x8a]                      
  017b  03d8             add bx, ax                               
  017d  368b07           mov ax, word ptr ss:[bx]                 
  0180  8946fe           mov word ptr [bp - 2], ax                
  0183  cd3b             int 0x3b                                 
  0185  46               inc si                                   
  0186  fecd             dec ch                                   
  0188  3406             xor al, 6                                
  018a  3e1f             pop ds                                   
  018c  cd38             int 0x38                                 
  018e  0e               push cs                                  
  018f  42               inc dx                                   
  0190  1f               pop ds                                   
  0191  9a571b0000       lcall 0, 0x1b57                          -> 0000:1b57
  0196  50               push ax                                  
  0197  8bde             mov bx, si                               
  0199  d1e3             shl bx, 1                                
  019b  8d4696           lea ax, [bp - 0x6a]                      
  019e  03d8             add bx, ax                               
  01a0  368b07           mov ax, word ptr ss:[bx]                 
  01a3  8946fe           mov word ptr [bp - 2], ax                
  01a6  cd3b             int 0x3b                                 
  01a8  46               inc si                                   
  01a9  fecd             dec ch                                   
  01ab  3406             xor al, 6                                
  01ad  3e1f             pop ds                                   
  01af  cd38             int 0x38                                 
  01b1  0e               push cs                                  
  01b2  42               inc dx                                   
  01b3  1f               pop ds                                   
  01b4  9a571b0000       lcall 0, 0x1b57                          -> 0000:1b57
  01b9  50               push ax                                  
  01ba  8bde             mov bx, si                               
  01bc  d1e3             shl bx, 1                                
  01be  8d46b6           lea ax, [bp - 0x4a]                      
  01c1  03d8             add bx, ax                               
  01c3  368b07           mov ax, word ptr ss:[bx]                 
  01c6  8946fe           mov word ptr [bp - 2], ax                
  01c9  cd3b             int 0x3b                                 
  01cb  46               inc si                                   
  01cc  fecd             dec ch                                   
  01ce  3406             xor al, 6                                
  01d0  3e1f             pop ds                                   
  01d2  cd38             int 0x38                                 
  01d4  0e               push cs                                  
  01d5  42               inc dx                                   
  01d6  1f               pop ds                                   
  01d7  9a571b0000       lcall 0, 0x1b57                          -> 0000:1b57
  01dc  50               push ax                                  
  01dd  56               push si                                  
  01de  90               nop                                      
  01df  0e               push cs                                  
  01e0  e81000           call 0x1f3                               
  01e3  83c408           add sp, 8                                
  01e6  8bc6             mov ax, si                               
  01e8  4e               dec si                                   
  01e9  0bc0             or ax, ax                                
  01eb  7403             je 0x1f0                                 
  01ed  e995fe           jmp 0x85                                 
  01f0  5e               pop si                                   
  01f1  c9               leave                                    
  01f2  cb               retf                                     

ovl55_01f3:  ; ENTRY
  01f3  55               push bp                                  
  01f4  8bec             mov bp, sp                               
  01f6  83ec10           sub sp, 0x10                             
  01f9  c746f01010       mov word ptr [bp - 0x10], 0x1010         
  01fe  8b4606           mov ax, word ptr [bp + 6]                
  0201  8946f2           mov word ptr [bp - 0xe], ax              
  0204  8a460a           mov al, byte ptr [bp + 0xa]              
  0207  8846f5           mov byte ptr [bp - 0xb], al              
  020a  8a460c           mov al, byte ptr [bp + 0xc]              
  020d  8846f4           mov byte ptr [bp - 0xc], al              
  0210  8a4608           mov al, byte ptr [bp + 8]                
  0213  8846f7           mov byte ptr [bp - 9], al                
  0216  16               push ss                                  
  0217  8d46f0           lea ax, [bp - 0x10]                      
  021a  50               push ax                                  
  021b  16               push ss                                  
  021c  50               push ax                                  
  021d  6a10             push 0x10                                
  021f  9a12380000       lcall 0, 0x3812                          -> 0000:3812
  0224  83c40a           add sp, 0xa                              
  0227  c9               leave                                    
  0228  cb               retf                                     

ovl55_0229:  ; ENTRY
  0229  55               push bp                                  
  022a  8bec             mov bp, sp                               
  022c  83ec10           sub sp, 0x10                             
  022f  56               push si                                  
  0230  57               push di                                  
  0231  6a02             push 2                                   
  0233  66ff7606         push dword ptr [bp + 6]                  
  0237  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  023c  83c406           add sp, 6                                
  023f  8bf8             mov di, ax                               
  0241  0bff             or di, di                                
  0243  7c5d             jl 0x2a2                                 
  0245  33f6             xor si, si                               
  0247  eb4d             jmp 0x296                                
  0249  6a0a             push 0xa                                 
  024b  16               push ss                                  
  024c  8d46f0           lea ax, [bp - 0x10]                      
  024f  50               push ax                                  
  0250  57               push di                                  
  0251  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0256  83c408           add sp, 8                                
  0259  c646fa00         mov byte ptr [bp - 6], 0                 
  025d  8bc6             mov ax, si                               
  025f  d1e0             shl ax, 1                                
  0261  8b5612           mov dx, word ptr [bp + 0x12]             
  0264  03d0             add dx, ax                               
  0266  ff7614           push word ptr [bp + 0x14]                
  0269  52               push dx                                  
  026a  8bc6             mov ax, si                               
  026c  d1e0             shl ax, 1                                
  026e  8b560e           mov dx, word ptr [bp + 0xe]              
  0271  03d0             add dx, ax                               
  0273  ff7610           push word ptr [bp + 0x10]                
  0276  52               push dx                                  
  0277  8bc6             mov ax, si                               
  0279  d1e0             shl ax, 1                                
  027b  8b560a           mov dx, word ptr [bp + 0xa]              
  027e  03d0             add dx, ax                               
  0280  ff760c           push word ptr [bp + 0xc]                 
  0283  52               push dx                                  
  0284  1e               push ds                                  
  0285  684a1f           push 0x1f4a                              
  0288  16               push ss                                  
  0289  8d46f0           lea ax, [bp - 0x10]                      
  028c  50               push ax                                  
  028d  9aba490000       lcall 0, 0x49ba                          -> 0000:49ba
  0292  83c414           add sp, 0x14                             
  0295  46               inc si                                   
  0296  83fe10           cmp si, 0x10                             
  0299  7cae             jl 0x249                                 
  029b  57               push di                                  
  029c  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  02a1  59               pop cx                                   
  02a2  5f               pop di                                   
  02a3  5e               pop si                                   
  02a4  c9               leave                                    
  02a5  cb               retf                                     
