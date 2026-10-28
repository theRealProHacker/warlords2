; res_116d file_off 0x136d0

res_116d_000e:  ; ENTRY
  000e  55               push bp                                  
  000f  8bec             mov bp, sp                               
  0011  c45e06           les bx, ptr [bp + 6]                     
  0014  8b460a           mov ax, word ptr [bp + 0xa]              
  0017  268907           mov word ptr es:[bx], ax                 
  001a  c45e06           les bx, ptr [bp + 6]                     
  001d  8b460c           mov ax, word ptr [bp + 0xc]              
  0020  26894702         mov word ptr es:[bx + 2], ax             
  0024  8b5608           mov dx, word ptr [bp + 8]                
  0027  8b4606           mov ax, word ptr [bp + 6]                
  002a  eb00             jmp 0x2c                                 
  002c  5d               pop bp                                   
  002d  cb               retf                                     

res_116d_002e:  ; ENTRY
  002e  55               push bp                                  
  002f  8bec             mov bp, sp                               
  0031  c45e06           les bx, ptr [bp + 6]                     
  0034  8b460a           mov ax, word ptr [bp + 0xa]              
  0037  268907           mov word ptr es:[bx], ax                 
  003a  c45e06           les bx, ptr [bp + 6]                     
  003d  8b460c           mov ax, word ptr [bp + 0xc]              
  0040  26894702         mov word ptr es:[bx + 2], ax             
  0044  c45e06           les bx, ptr [bp + 6]                     
  0047  8b460e           mov ax, word ptr [bp + 0xe]              
  004a  26894704         mov word ptr es:[bx + 4], ax             
  004e  c45e06           les bx, ptr [bp + 6]                     
  0051  8b4610           mov ax, word ptr [bp + 0x10]             
  0054  26894706         mov word ptr es:[bx + 6], ax             
  0058  8b5608           mov dx, word ptr [bp + 8]                
  005b  8b4606           mov ax, word ptr [bp + 6]                
  005e  eb00             jmp 0x60                                 
  0060  5d               pop bp                                   
  0061  cb               retf                                     
  0062  55               push bp                                  
  0063  8bec             mov bp, sp                               
  0065  c45e06           les bx, ptr [bp + 6]                     
  0068  8b460a           mov ax, word ptr [bp + 0xa]              
  006b  260107           add word ptr es:[bx], ax                 
  006e  c45e06           les bx, ptr [bp + 6]                     
  0071  8b460c           mov ax, word ptr [bp + 0xc]              
  0074  26014702         add word ptr es:[bx + 2], ax             
  0078  8b5608           mov dx, word ptr [bp + 8]                
  007b  8b4606           mov ax, word ptr [bp + 6]                
  007e  eb00             jmp 0x80                                 
  0080  5d               pop bp                                   
  0081  cb               retf                                     
  0082  55               push bp                                  
  0083  8bec             mov bp, sp                               
  0085  8b560a           mov dx, word ptr [bp + 0xa]              
  0088  8b4e0c           mov cx, word ptr [bp + 0xc]              
  008b  c45e06           les bx, ptr [bp + 6]                     
  008e  260117           add word ptr es:[bx], dx                 
  0091  c45e06           les bx, ptr [bp + 6]                     
  0094  26014f02         add word ptr es:[bx + 2], cx             
  0098  8bc2             mov ax, dx                               
  009a  d1e0             shl ax, 1                                
  009c  c45e06           les bx, ptr [bp + 6]                     
  009f  26294704         sub word ptr es:[bx + 4], ax             
  00a3  8bc1             mov ax, cx                               
  00a5  d1e0             shl ax, 1                                
  00a7  c45e06           les bx, ptr [bp + 6]                     
  00aa  26294706         sub word ptr es:[bx + 6], ax             
  00ae  8b5608           mov dx, word ptr [bp + 8]                
  00b1  8b4606           mov ax, word ptr [bp + 6]                
  00b4  eb00             jmp 0xb6                                 
  00b6  5d               pop bp                                   
  00b7  cb               retf                                     

res_116d_00b8:  ; ENTRY
  00b8  55               push bp                                  
  00b9  8bec             mov bp, sp                               
  00bb  c45e0a           les bx, ptr [bp + 0xa]                   
  00be  26ff7702         push word ptr es:[bx + 2]                
  00c2  c45e0a           les bx, ptr [bp + 0xa]                   
  00c5  26ff37           push word ptr es:[bx]                    
  00c8  ff7608           push word ptr [bp + 8]                   
  00cb  ff7606           push word ptr [bp + 6]                   
  00ce  90               nop                                      
  00cf  0e               push cs                                  
  00d0  e8de00           call 0x1b1                               
  00d3  83c408           add sp, 8                                
  00d6  eb00             jmp 0xd8                                 
  00d8  5d               pop bp                                   
  00d9  cb               retf                                     
  00da  55               push bp                                  
  00db  8bec             mov bp, sp                               
  00dd  56               push si                                  
  00de  c45e06           les bx, ptr [bp + 6]                     
  00e1  268b07           mov ax, word ptr es:[bx]                 
  00e4  c45e0a           les bx, ptr [bp + 0xa]                   
  00e7  263b07           cmp ax, word ptr es:[bx]                 
  00ea  7d0b             jge 0xf7                                 
  00ec  c45e06           les bx, ptr [bp + 6]                     
  00ef  268b17           mov dx, word ptr es:[bx]                 
  00f2  c45e0a           les bx, ptr [bp + 0xa]                   
  00f5  eb09             jmp 0x100                                
  00f7  c45e0a           les bx, ptr [bp + 0xa]                   
  00fa  268b17           mov dx, word ptr es:[bx]                 
  00fd  c45e06           les bx, ptr [bp + 6]                     
  0100  268b37           mov si, word ptr es:[bx]                 
  0103  c45e06           les bx, ptr [bp + 6]                     
  0106  268b4702         mov ax, word ptr es:[bx + 2]             
  010a  c45e0a           les bx, ptr [bp + 0xa]                   
  010d  263b4702         cmp ax, word ptr es:[bx + 2]             
  0111  7d0c             jge 0x11f                                
  0113  c45e06           les bx, ptr [bp + 6]                     
  0116  268b4f02         mov cx, word ptr es:[bx + 2]             
  011a  c45e0a           les bx, ptr [bp + 0xa]                   
  011d  eb0a             jmp 0x129                                
  011f  c45e0a           les bx, ptr [bp + 0xa]                   
  0122  268b4f02         mov cx, word ptr es:[bx + 2]             
  0126  c45e06           les bx, ptr [bp + 6]                     
  0129  268b5f02         mov bx, word ptr es:[bx + 2]             
  012d  53               push bx                                  
  012e  56               push si                                  
  012f  51               push cx                                  
  0130  52               push dx                                  
  0131  ff7610           push word ptr [bp + 0x10]                
  0134  ff760e           push word ptr [bp + 0xe]                 
  0137  0e               push cs                                  
  0138  e8f3fe           call 0x2e                                
  013b  83c40c           add sp, 0xc                              
  013e  eb00             jmp 0x140                                
  0140  5e               pop si                                   
  0141  5d               pop bp                                   
  0142  cb               retf                                     
  0143  55               push bp                                  
  0144  8bec             mov bp, sp                               
  0146  c45e06           les bx, ptr [bp + 6]                     
  0149  268b07           mov ax, word ptr es:[bx]                 
  014c  c45e0a           les bx, ptr [bp + 0xa]                   
  014f  263b07           cmp ax, word ptr es:[bx]                 
  0152  7535             jne 0x189                                
  0154  c45e06           les bx, ptr [bp + 6]                     
  0157  268b4702         mov ax, word ptr es:[bx + 2]             
  015b  c45e0a           les bx, ptr [bp + 0xa]                   
  015e  263b4702         cmp ax, word ptr es:[bx + 2]             
  0162  7525             jne 0x189                                
  0164  c45e06           les bx, ptr [bp + 6]                     
  0167  268b4704         mov ax, word ptr es:[bx + 4]             
  016b  c45e0a           les bx, ptr [bp + 0xa]                   
  016e  263b4704         cmp ax, word ptr es:[bx + 4]             
  0172  7515             jne 0x189                                
  0174  c45e06           les bx, ptr [bp + 6]                     
  0177  268b4706         mov ax, word ptr es:[bx + 6]             
  017b  c45e0a           les bx, ptr [bp + 0xa]                   
  017e  263b4706         cmp ax, word ptr es:[bx + 6]             
  0182  7505             jne 0x189                                
  0184  b80100           mov ax, 1                                
  0187  eb02             jmp 0x18b                                
  0189  33c0             xor ax, ax                               
  018b  eb00             jmp 0x18d                                
  018d  5d               pop bp                                   
  018e  cb               retf                                     
  018f  55               push bp                                  
  0190  8bec             mov bp, sp                               
  0192  c45e06           les bx, ptr [bp + 6]                     
  0195  26837f0400       cmp word ptr es:[bx + 4], 0              
  019a  7e0a             jle 0x1a6                                
  019c  c45e06           les bx, ptr [bp + 6]                     
  019f  26837f0600       cmp word ptr es:[bx + 6], 0              
  01a4  7f05             jg 0x1ab                                 
  01a6  b80100           mov ax, 1                                
  01a9  eb02             jmp 0x1ad                                
  01ab  33c0             xor ax, ax                               
  01ad  eb00             jmp 0x1af                                
  01af  5d               pop bp                                   
  01b0  cb               retf                                     

res_116d_01b1:  ; ENTRY
  01b1  55               push bp                                  
  01b2  8bec             mov bp, sp                               
  01b4  56               push si                                  
  01b5  8b560a           mov dx, word ptr [bp + 0xa]              
  01b8  8b4e0c           mov cx, word ptr [bp + 0xc]              
  01bb  c45e06           les bx, ptr [bp + 6]                     
  01be  263917           cmp word ptr es:[bx], dx                 
  01c1  7f33             jg 0x1f6                                 
  01c3  c45e06           les bx, ptr [bp + 6]                     
  01c6  06               push es                                  
  01c7  c47606           les si, ptr [bp + 6]                     
  01ca  268b04           mov ax, word ptr es:[si]                 
  01cd  07               pop es                                   
  01ce  26034704         add ax, word ptr es:[bx + 4]             
  01d2  3bc2             cmp ax, dx                               
  01d4  7e20             jle 0x1f6                                
  01d6  c45e06           les bx, ptr [bp + 6]                     
  01d9  26394f02         cmp word ptr es:[bx + 2], cx             
  01dd  7f17             jg 0x1f6                                 
  01df  c45e06           les bx, ptr [bp + 6]                     
  01e2  268b4702         mov ax, word ptr es:[bx + 2]             
  01e6  c45e06           les bx, ptr [bp + 6]                     
  01e9  26034706         add ax, word ptr es:[bx + 6]             
  01ed  3bc1             cmp ax, cx                               
  01ef  7e05             jle 0x1f6                                
  01f1  b80100           mov ax, 1                                
  01f4  eb02             jmp 0x1f8                                
  01f6  33c0             xor ax, ax                               
  01f8  eb00             jmp 0x1fa                                
  01fa  5e               pop si                                   
  01fb  5d               pop bp                                   
  01fc  cb               retf                                     

res_116d_01fd:  ; ENTRY
  01fd  55               push bp                                  
  01fe  8bec             mov bp, sp                               
  0200  56               push si                                  
  0201  c45e06           les bx, ptr [bp + 6]                     
  0204  26ff7704         push word ptr es:[bx + 4]                
  0208  c45e06           les bx, ptr [bp + 6]                     
  020b  26ff7702         push word ptr es:[bx + 2]                
  020f  c45e06           les bx, ptr [bp + 6]                     
  0212  26ff37           push word ptr es:[bx]                    
  0215  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  021a  83c406           add sp, 6                                
  021d  c45e06           les bx, ptr [bp + 6]                     
  0220  26ff7704         push word ptr es:[bx + 4]                
  0224  c45e06           les bx, ptr [bp + 6]                     
  0227  268b4702         mov ax, word ptr es:[bx + 2]             
  022b  c45e06           les bx, ptr [bp + 6]                     
  022e  26034706         add ax, word ptr es:[bx + 6]             
  0232  48               dec ax                                   
  0233  50               push ax                                  
  0234  c45e06           les bx, ptr [bp + 6]                     
  0237  26ff37           push word ptr es:[bx]                    
  023a  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  023f  83c406           add sp, 6                                
  0242  c45e06           les bx, ptr [bp + 6]                     
  0245  26ff7706         push word ptr es:[bx + 6]                
  0249  c45e06           les bx, ptr [bp + 6]                     
  024c  26ff7702         push word ptr es:[bx + 2]                
  0250  c45e06           les bx, ptr [bp + 6]                     
  0253  26ff37           push word ptr es:[bx]                    
  0256  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  025b  83c406           add sp, 6                                
  025e  c45e06           les bx, ptr [bp + 6]                     
  0261  26ff7706         push word ptr es:[bx + 6]                
  0265  c45e06           les bx, ptr [bp + 6]                     
  0268  26ff7702         push word ptr es:[bx + 2]                
  026c  c45e06           les bx, ptr [bp + 6]                     
  026f  06               push es                                  
  0270  c47606           les si, ptr [bp + 6]                     
  0273  268b04           mov ax, word ptr es:[si]                 
  0276  07               pop es                                   
  0277  26034704         add ax, word ptr es:[bx + 4]             
  027b  48               dec ax                                   
  027c  50               push ax                                  
  027d  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  0282  83c406           add sp, 6                                
  0285  5e               pop si                                   
  0286  5d               pop bp                                   
  0287  cb               retf                                     

res_116d_0288:  ; ENTRY
  0288  55               push bp                                  
  0289  8bec             mov bp, sp                               
  028b  56               push si                                  
  028c  833e843300       cmp word ptr [0x3384], 0                 
  0291  7410             je 0x2a3                                 
  0293  ff7608           push word ptr [bp + 8]                   
  0296  ff7606           push word ptr [bp + 6]                   
  0299  90               nop                                      
  029a  0e               push cs                                  
  029b  e83a00           call 0x2d8                               
  029e  83c404           add sp, 4                                
  02a1  eb32             jmp 0x2d5                                
  02a3  c45e06           les bx, ptr [bp + 6]                     
  02a6  268b7702         mov si, word ptr es:[bx + 2]             
  02aa  eb17             jmp 0x2c3                                
  02ac  c45e06           les bx, ptr [bp + 6]                     
  02af  26ff7704         push word ptr es:[bx + 4]                
  02b3  56               push si                                  
  02b4  c45e06           les bx, ptr [bp + 6]                     
  02b7  26ff37           push word ptr es:[bx]                    
  02ba  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  02bf  83c406           add sp, 6                                
  02c2  46               inc si                                   
  02c3  c45e06           les bx, ptr [bp + 6]                     
  02c6  268b4702         mov ax, word ptr es:[bx + 2]             
  02ca  c45e06           les bx, ptr [bp + 6]                     
  02cd  26034706         add ax, word ptr es:[bx + 6]             
  02d1  3bc6             cmp ax, si                               
  02d3  7fd7             jg 0x2ac                                 
  02d5  5e               pop si                                   
  02d6  5d               pop bp                                   
  02d7  cb               retf                                     

res_116d_02d8:  ; ENTRY
  02d8  c8160000         enter 0x16, 0                            
  02dc  56               push si                                  
  02dd  57               push di                                  
  02de  c45e06           les bx, ptr [bp + 6]                     
  02e1  268b4702         mov ax, word ptr es:[bx + 2]             
  02e5  c41e4970         les bx, ptr [0x7049]                     
  02e9  2603470a         add ax, word ptr es:[bx + 0xa]           
  02ed  8946f6           mov word ptr [bp - 0xa], ax              
  02f0  c41e4970         les bx, ptr [0x7049]                     
  02f4  06               push es                                  
  02f5  c47606           les si, ptr [bp + 6]                     
  02f8  268b04           mov ax, word ptr es:[si]                 
  02fb  07               pop es                                   
  02fc  26034708         add ax, word ptr es:[bx + 8]             
  0300  8bf0             mov si, ax                               
  0302  c41e4970         les bx, ptr [0x7049]                     
  0306  268b475d         mov ax, word ptr es:[bx + 0x5d]          
  030a  8946f4           mov word ptr [bp - 0xc], ax              
  030d  c746f00000       mov word ptr [bp - 0x10], 0              
  0312  33c9             xor cx, cx                               
  0314  c41ee734         les bx, ptr [0x34e7]                     
  0318  26833f01         cmp word ptr es:[bx], 1                  
  031c  7414             je 0x332                                 
  031e  c41ee734         les bx, ptr [0x34e7]                     
  0322  26833f02         cmp word ptr es:[bx], 2                  
  0326  740a             je 0x332                                 
  0328  c41ee734         les bx, ptr [0x34e7]                     
  032c  26833f04         cmp word ptr es:[bx], 4                  
  0330  7505             jne 0x337                                
  0332  b85000           mov ax, 0x50                             
  0335  eb03             jmp 0x33a                                
  0337  b82800           mov ax, 0x28                             
  033a  8946ec           mov word ptr [bp - 0x14], ax             
  033d  8a46eb           mov al, byte ptr [bp - 0x15]             
  0340  8846eb           mov byte ptr [bp - 0x15], al             
  0343  8bc6             mov ax, si                               
  0345  bb0800           mov bx, 8                                
  0348  99               cdq                                      
  0349  f7fb             idiv bx                                  
  034b  8bda             mov bx, dx                               
  034d  8a872e35         mov al, byte ptr [bx + 0x352e]           
  0351  b400             mov ah, 0                                
  0353  8946f2           mov word ptr [bp - 0xe], ax              
  0356  8bc6             mov ax, si                               
  0358  bb0800           mov bx, 8                                
  035b  99               cdq                                      
  035c  f7fb             idiv bx                                  
  035e  b80800           mov ax, 8                                
  0361  2bc2             sub ax, dx                               
  0363  8946ee           mov word ptr [bp - 0x12], ax             
  0366  c45e06           les bx, ptr [bp + 6]                     
  0369  8bc6             mov ax, si                               
  036b  26034704         add ax, word ptr es:[bx + 4]             
  036f  48               dec ax                                   
  0370  bb0800           mov bx, 8                                
  0373  99               cdq                                      
  0374  f7fb             idiv bx                                  
  0376  8bfa             mov di, dx                               
  0378  8bda             mov bx, dx                               
  037a  8a873635         mov al, byte ptr [bx + 0x3536]           
  037e  b400             mov ah, 0                                
  0380  8bc8             mov cx, ax                               
  0382  47               inc di                                   
  0383  c45e06           les bx, ptr [bp + 6]                     
  0386  268b4704         mov ax, word ptr es:[bx + 4]             
  038a  3b46ee           cmp ax, word ptr [bp - 0x12]             
  038d  7f08             jg 0x397                                 
  038f  214ef2           and word ptr [bp - 0xe], cx              
  0392  b9ffff           mov cx, 0xffff                           
  0395  eb23             jmp 0x3ba                                
  0397  c45e06           les bx, ptr [bp + 6]                     
  039a  8b46ee           mov ax, word ptr [bp - 0x12]             
  039d  03c7             add ax, di                               
  039f  26394704         cmp word ptr es:[bx + 4], ax             
  03a3  7415             je 0x3ba                                 
  03a5  c45e06           les bx, ptr [bp + 6]                     
  03a8  268b4704         mov ax, word ptr es:[bx + 4]             
  03ac  2b46ee           sub ax, word ptr [bp - 0x12]             
  03af  2bc7             sub ax, di                               
  03b1  bb0800           mov bx, 8                                
  03b4  99               cdq                                      
  03b5  f7fb             idiv bx                                  
  03b7  8946f0           mov word ptr [bp - 0x10], ax             
  03ba  bace03           mov dx, 0x3ce                            
  03bd  b005             mov al, 5                                
  03bf  ee               out dx, al                               
  03c0  bacf03           mov dx, 0x3cf                            
  03c3  b002             mov al, 2                                
  03c5  ee               out dx, al                               
  03c6  bac403           mov dx, 0x3c4                            
  03c9  b002             mov al, 2                                
  03cb  ee               out dx, al                               
  03cc  bac503           mov dx, 0x3c5                            
  03cf  b00f             mov al, 0xf                              
  03d1  ee               out dx, al                               
  03d2  bace03           mov dx, 0x3ce                            
  03d5  b008             mov al, 8                                
  03d7  ee               out dx, al                               
  03d8  8b46f6           mov ax, word ptr [bp - 0xa]              
  03db  f76eec           imul word ptr [bp - 0x14]                
  03de  8bd6             mov dx, si                               
  03e0  c1fa03           sar dx, 3                                
  03e3  03c2             add ax, dx                               
  03e5  c746fa00a0       mov word ptr [bp - 6], 0xa000            
  03ea  8946f8           mov word ptr [bp - 8], ax                
  03ed  33f6             xor si, si                               
  03ef  eb6d             jmp 0x45e                                
  03f1  8bc6             mov ax, si                               
  03f3  f76eec           imul word ptr [bp - 0x14]                
  03f6  8b56fa           mov dx, word ptr [bp - 6]                
  03f9  8b5ef8           mov bx, word ptr [bp - 8]                
  03fc  03d8             add bx, ax                               
  03fe  8956fe           mov word ptr [bp - 2], dx                
  0401  895efc           mov word ptr [bp - 4], bx                
  0404  c45efc           les bx, ptr [bp - 4]                     
  0407  268a07           mov al, byte ptr es:[bx]                 
  040a  8846eb           mov byte ptr [bp - 0x15], al             
  040d  bacf03           mov dx, 0x3cf                            
  0410  8a46f2           mov al, byte ptr [bp - 0xe]              
  0413  ee               out dx, al                               
  0414  c45efc           les bx, ptr [bp - 4]                     
  0417  8a46f4           mov al, byte ptr [bp - 0xc]              
  041a  268807           mov byte ptr es:[bx], al                 
  041d  ff46fc           inc word ptr [bp - 4]                    
  0420  bacf03           mov dx, 0x3cf                            
  0423  b0ff             mov al, 0xff                             
  0425  ee               out dx, al                               
  0426  8b56f0           mov dx, word ptr [bp - 0x10]             
  0429  eb0c             jmp 0x437                                
  042b  c45efc           les bx, ptr [bp - 4]                     
  042e  8a46f4           mov al, byte ptr [bp - 0xc]              
  0431  268807           mov byte ptr es:[bx], al                 
  0434  ff46fc           inc word ptr [bp - 4]                    
  0437  8bc2             mov ax, dx                               
  0439  4a               dec dx                                   
  043a  0bc0             or ax, ax                                
  043c  75ed             jne 0x42b                                
  043e  0bc9             or cx, cx                                
  0440  7418             je 0x45a                                 
  0442  c45efc           les bx, ptr [bp - 4]                     
  0445  268a07           mov al, byte ptr es:[bx]                 
  0448  8846eb           mov byte ptr [bp - 0x15], al             
  044b  bacf03           mov dx, 0x3cf                            
  044e  8ac1             mov al, cl                               
  0450  ee               out dx, al                               
  0451  c45efc           les bx, ptr [bp - 4]                     
  0454  8a46f4           mov al, byte ptr [bp - 0xc]              
  0457  268807           mov byte ptr es:[bx], al                 
  045a  ff46f6           inc word ptr [bp - 0xa]                  
  045d  46               inc si                                   
  045e  c45e06           les bx, ptr [bp + 6]                     
  0461  26397706         cmp word ptr es:[bx + 6], si             
  0465  7f8a             jg 0x3f1                                 
  0467  bace03           mov dx, 0x3ce                            
  046a  b008             mov al, 8                                
  046c  ee               out dx, al                               
  046d  bacf03           mov dx, 0x3cf                            
  0470  b0ff             mov al, 0xff                             
  0472  ee               out dx, al                               
  0473  bace03           mov dx, 0x3ce                            
  0476  b005             mov al, 5                                
  0478  ee               out dx, al                               
  0479  bacf03           mov dx, 0x3cf                            
  047c  b000             mov al, 0                                
  047e  ee               out dx, al                               
  047f  5f               pop di                                   
  0480  5e               pop si                                   
  0481  c9               leave                                    
  0482  cb               retf                                     
  0483  55               push bp                                  
