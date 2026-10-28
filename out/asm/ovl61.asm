; ovl61 stub 30d7 file_off 0x766f0 size 0x2278

ovl61_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  56               push si                                  
  0004  57               push di                                  
  0005  8b7608           mov si, word ptr [bp + 8]                
  0008  33ff             xor di, di                               
  000a  837e0600         cmp word ptr [bp + 6], 0                 
  000e  7410             je 0x20                                  
  0010  6a00             push 0                                   
  0012  90               nop                                      
  0013  0e               push cs                                  
  0014  e81309           call 0x92a                               
  0017  59               pop cx                                   
  0018  6a00             push 0                                   
  001a  9a2f137213       lcall 0x1372, 0x132f                     -> 1372:132f
  001f  59               pop cx                                   
  0020  0bf6             or si, si                                
  0022  741d             je 0x41                                  
  0024  90               nop                                      
  0025  0e               push cs                                  
  0026  e80917           call 0x1732                              
  0029  90               nop                                      
  002a  0e               push cs                                  
  002b  e8c817           call 0x17f6                              
  002e  666801000100     push 0x10001                             
  0034  9a34002031       lcall 0x3120, 0x34                       -> ovl68:0952
  0039  83c404           add sp, 4                                
  003c  9a20009930       lcall 0x3099, 0x20                       -> ovl53:0000
  0041  c706862a0100     mov word ptr [0x2a86], 1                 
  0047  c7066a160000     mov word ptr [0x166a], 0                 
  004d  6a00             push 0                                   
  004f  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  0054  59               pop cx                                   
  0055  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  005a  0bf6             or si, si                                
  005c  7516             jne 0x74                                 
  005e  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  0063  666a00           push 0                                   
  0066  666801000100     push 0x10001                             
  006c  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  0071  83c408           add sp, 8                                
  0074  90               nop                                      
  0075  0e               push cs                                  
  0076  e8720a           call 0xaeb                               
  0079  90               nop                                      
  007a  0e               push cs                                  
  007b  e81f0a           call 0xa9d                               
  007e  90               nop                                      
  007f  0e               push cs                                  
  0080  e8f100           call 0x174                               
  0083  6a00             push 0                                   
  0085  9a2f137213       lcall 0x1372, 0x132f                     -> 1372:132f
  008a  59               pop cx                                   
  008b  0bf6             or si, si                                
  008d  7505             jne 0x94                                 
  008f  9a34000c31       lcall 0x310c, 0x34                       -> ovl66:0356
  0094  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0099  0bf6             or si, si                                
  009b  747e             je 0x11b                                 
  009d  90               nop                                      
  009e  0e               push cs                                  
  009f  e87603           call 0x418                               
  00a2  b8042c           mov ax, 0x2c04                           
  00a5  8ec0             mov es, ax                               
  00a7  26833e240100     cmp word ptr es:[0x124], 0               
  00ad  7511             jne 0xc0                                 
  00af  666a00           push 0                                   
  00b2  666801000100     push 0x10001                             
  00b8  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  00bd  83c408           add sp, 8                                
  00c0  33d2             xor dx, dx                               
  00c2  eb24             jmp 0xe8                                 
  00c4  8bda             mov bx, dx                               
  00c6  d1e3             shl bx, 1                                
  00c8  b8042c           mov ax, 0x2c04                           
  00cb  8ec0             mov es, ax                               
  00cd  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  00d3  7412             je 0xe7                                  
  00d5  8bda             mov bx, dx                               
  00d7  d1e3             shl bx, 1                                
  00d9  b8042c           mov ax, 0x2c04                           
  00dc  8ec0             mov es, ax                               
  00de  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  00e4  7501             jne 0xe7                                 
  00e6  47               inc di                                   
  00e7  42               inc dx                                   
  00e8  83fa08           cmp dx, 8                                
  00eb  7cd7             jl 0xc4                                  
  00ed  0bff             or di, di                                
  00ef  7525             jne 0x116                                
  00f1  66680e000100     push 0x1000e                             
  00f7  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  00fc  83c404           add sp, 4                                
  00ff  52               push dx                                  
  0100  50               push ax                                  
  0101  666a0e           push 0xe                                 
  0104  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0109  83c404           add sp, 4                                
  010c  52               push dx                                  
  010d  50               push ax                                  
  010e  90               nop                                      
  010f  0e               push cs                                  
  0110  e84d10           call 0x1160                              
  0113  83c408           add sp, 8                                
  0116  90               nop                                      
  0117  0e               push cs                                  
  0118  e80820           call 0x2123                              
  011b  5f               pop di                                   
  011c  5e               pop si                                   
  011d  5d               pop bp                                   
  011e  cb               retf                                     

ovl61_011f:  ; ENTRY
  011f  55               push bp                                  
  0120  8bec             mov bp, sp                               
  0122  c706862a0100     mov word ptr [0x2a86], 1                 
  0128  c7066a160000     mov word ptr [0x166a], 0                 
  012e  6a00             push 0                                   
  0130  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  0135  59               pop cx                                   
  0136  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  013b  90               nop                                      
  013c  0e               push cs                                  
  013d  e83400           call 0x174                               
  0140  837e0600         cmp word ptr [bp + 6], 0                 
  0144  7405             je 0x14b                                 
  0146  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  014b  837e0800         cmp word ptr [bp + 8], 0                 
  014f  7411             je 0x162                                 
  0151  666a00           push 0                                   
  0154  666801000100     push 0x10001                             
  015a  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  015f  83c408           add sp, 8                                
  0162  837e0a00         cmp word ptr [bp + 0xa], 0               
  0166  7405             je 0x16d                                 
  0168  9a34000c31       lcall 0x310c, 0x34                       -> ovl66:0356
  016d  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0172  5d               pop bp                                   
  0173  cb               retf                                     

ovl61_0174:  ; ENTRY
  0174  55               push bp                                  
  0175  8bec             mov bp, sp                               
  0177  56               push si                                  
  0178  66833e625e00     cmp dword ptr [0x5e62], 0                
  017e  740d             je 0x18d                                 
  0180  a1a62e           mov ax, word ptr [0x2ea6]                
  0183  3b06a82e         cmp ax, word ptr [0x2ea8]                
  0187  7e04             jle 0x18d                                
  0189  6a01             push 1                                   
  018b  eb02             jmp 0x18f                                
  018d  6a02             push 2                                   
  018f  68ad00           push 0xad                                
  0192  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0197  83c404           add sp, 4                                
  019a  9a57001931       lcall 0x3119, 0x57                       -> ovl67:09e7
  019f  0bc0             or ax, ax                                
  01a1  7404             je 0x1a7                                 
  01a3  6a01             push 1                                   
  01a5  eb02             jmp 0x1a9                                
  01a7  6a02             push 2                                   
  01a9  68ae00           push 0xae                                
  01ac  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  01b1  83c404           add sp, 4                                
  01b4  9a57001931       lcall 0x3119, 0x57                       -> ovl67:09e7
  01b9  0bc0             or ax, ax                                
  01bb  740c             je 0x1c9                                 
  01bd  66833e625e00     cmp dword ptr [0x5e62], 0                
  01c3  7404             je 0x1c9                                 
  01c5  6a01             push 1                                   
  01c7  eb02             jmp 0x1cb                                
  01c9  6a02             push 2                                   
  01cb  68af00           push 0xaf                                
  01ce  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  01d3  83c404           add sp, 4                                
  01d6  66833e625e00     cmp dword ptr [0x5e62], 0                
  01dc  7404             je 0x1e2                                 
  01de  6a01             push 1                                   
  01e0  eb02             jmp 0x1e4                                
  01e2  6a02             push 2                                   
  01e4  68b000           push 0xb0                                
  01e7  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  01ec  83c404           add sp, 4                                
  01ef  66833e625e00     cmp dword ptr [0x5e62], 0                
  01f5  7404             je 0x1fb                                 
  01f7  6a01             push 1                                   
  01f9  eb02             jmp 0x1fd                                
  01fb  6a02             push 2                                   
  01fd  68ba00           push 0xba                                 ; "%s's Quest"
  0200  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0205  83c404           add sp, 4                                
  0208  6668bc000100     push 0x100bc                             
  020e  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0213  83c404           add sp, 4                                
  0216  66833e625e00     cmp dword ptr [0x5e62], 0                
  021c  7416             je 0x234                                 
  021e  c41e625e         les bx, ptr [0x5e62]                     
  0222  26837f1200       cmp word ptr es:[bx + 0x12], 0           
  0227  7c0b             jl 0x234                                 
  0229  26837f1400       cmp word ptr es:[bx + 0x14], 0           
  022e  7c04             jl 0x234                                 
  0230  6a01             push 1                                   
  0232  eb02             jmp 0x236                                
  0234  6a02             push 2                                   
  0236  68bb00           push 0xbb                                
  0239  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  023e  83c404           add sp, 4                                
  0241  66833e625e00     cmp dword ptr [0x5e62], 0                
  0247  744b             je 0x294                                 
  0249  6668b1000100     push 0x100b1                             
  024f  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0254  83c404           add sp, 4                                
  0257  6668b2000100     push 0x100b2                             
  025d  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0262  83c404           add sp, 4                                
  0265  9a4d000c31       lcall 0x310c, 0x4d                       -> ovl66:0567
  026a  0bc0             or ax, ax                                
  026c  740d             je 0x27b                                 
  026e  68f000           push 0xf0                                
  0271  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  0276  59               pop cx                                   
  0277  6a01             push 1                                   
  0279  eb45             jmp 0x2c0                                
  027b  6668f0000100     push 0x100f0                             
  0281  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0286  83c404           add sp, 4                                
  0289  68f100           push 0xf1                                
  028c  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  0291  59               pop cx                                   
  0292  eb37             jmp 0x2cb                                
  0294  6668b1000200     push 0x200b1                             
  029a  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  029f  83c404           add sp, 4                                
  02a2  6668b2000200     push 0x200b2                             
  02a8  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  02ad  83c404           add sp, 4                                
  02b0  6668f0000200     push 0x200f0                             
  02b6  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  02bb  83c404           add sp, 4                                
  02be  6a02             push 2                                   
  02c0  68f100           push 0xf1                                
  02c3  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  02c8  83c404           add sp, 4                                
  02cb  33f6             xor si, si                               
  02cd  eb11             jmp 0x2e0                                
  02cf  6a01             push 1                                   
  02d1  8bc6             mov ax, si                               
  02d3  054001           add ax, 0x140                            
  02d6  50               push ax                                  
  02d7  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  02dc  83c404           add sp, 4                                
  02df  46               inc si                                   
  02e0  83fe08           cmp si, 8                                
  02e3  7cea             jl 0x2cf                                 
  02e5  33f6             xor si, si                               
  02e7  eb41             jmp 0x32a                                
  02e9  3b36f630         cmp si, word ptr [0x30f6]                
  02ed  7d22             jge 0x311                                
  02ef  6a01             push 1                                   
  02f1  8bc6             mov ax, si                               
  02f3  05e000           add ax, 0xe0                             
  02f6  50               push ax                                  
  02f7  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  02fc  83c404           add sp, 4                                
  02ff  6a01             push 1                                   
  0301  8bc6             mov ax, si                               
  0303  05e800           add ax, 0xe8                             
  0306  50               push ax                                  
  0307  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  030c  83c404           add sp, 4                                
  030f  eb18             jmp 0x329                                
  0311  8bc6             mov ax, si                               
  0313  05e000           add ax, 0xe0                             
  0316  50               push ax                                  
  0317  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  031c  59               pop cx                                   
  031d  8bc6             mov ax, si                               
  031f  05e800           add ax, 0xe8                             
  0322  50               push ax                                  
  0323  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  0328  59               pop cx                                   
  0329  46               inc si                                   
  032a  83fe08           cmp si, 8                                
  032d  7cba             jl 0x2e9                                 
  032f  b8042c           mov ax, 0x2c04                           
  0332  8ec0             mov es, ax                               
  0334  26833e1c0100     cmp word ptr es:[0x11c], 0               
  033a  7523             jne 0x35f                                
  033c  6668b7000200     push 0x200b7                             
  0342  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0347  83c404           add sp, 4                                
  034a  68b800           push 0xb8                                
  034d  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  0352  59               pop cx                                   
  0353  68b900           push 0xb9                                
  0356  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  035b  59               pop cx                                   
  035c  e9ac00           jmp 0x40b                                
  035f  b8042c           mov ax, 0x2c04                           
  0362  8ec0             mov es, ax                               
  0364  26a11001         mov ax, word ptr es:[0x110]              
  0368  c1e003           shl ax, 3                                
  036b  ba042c           mov dx, 0x2c04                           
  036e  8ec2             mov es, dx                               
  0370  2603061001       add ax, word ptr es:[0x110]              
  0375  ba042c           mov dx, 0x2c04                           
  0378  8bd8             mov bx, ax                               
  037a  8ec2             mov es, dx                               
  037c  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0381  c1e804           shr ax, 4                                
  0384  250100           and ax, 1                                
  0387  0bc0             or ax, ax                                
  0389  7460             je 0x3eb                                 
  038b  b8042c           mov ax, 0x2c04                           
  038e  8ec0             mov es, ax                               
  0390  26a11001         mov ax, word ptr es:[0x110]              
  0394  c1e003           shl ax, 3                                
  0397  ba042c           mov dx, 0x2c04                           
  039a  8ec2             mov es, dx                               
  039c  2603061001       add ax, word ptr es:[0x110]              
  03a1  ba042c           mov dx, 0x2c04                           
  03a4  8bd8             mov bx, ax                               
  03a6  8ec2             mov es, dx                               
  03a8  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  03ad  c1e805           shr ax, 5                                
  03b0  250100           and ax, 1                                
  03b3  0bc0             or ax, ax                                
  03b5  741a             je 0x3d1                                 
  03b7  68b700           push 0xb7                                
  03ba  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  03bf  59               pop cx                                   
  03c0  68b800           push 0xb8                                
  03c3  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  03c8  59               pop cx                                   
  03c9  6668b9000100     push 0x100b9                             
  03cf  eb32             jmp 0x403                                
  03d1  68b700           push 0xb7                                
  03d4  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  03d9  59               pop cx                                   
  03da  68b900           push 0xb9                                
  03dd  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  03e2  59               pop cx                                   
  03e3  6668b8000100     push 0x100b8                             
  03e9  eb18             jmp 0x403                                
  03eb  68b800           push 0xb8                                
  03ee  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  03f3  59               pop cx                                   
  03f4  68b900           push 0xb9                                
  03f7  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  03fc  59               pop cx                                   
  03fd  6668b7000100     push 0x100b7                             
  0403  9af005a908       lcall 0x8a9, 0x5f0                       -> 08a9:05f0
  0408  83c404           add sp, 4                                
  040b  90               nop                                      
  040c  0e               push cs                                  
  040d  e80901           call 0x519                               
  0410  9a48009f2f       lcall 0x2f9f, 0x48                       -> ovl14:00aa
  0415  5e               pop si                                   
  0416  5d               pop bp                                   
  0417  cb               retf                                     

ovl61_0418:  ; ENTRY
  0418  55               push bp                                  
  0419  8bec             mov bp, sp                               
  041b  56               push si                                  
  041c  6668ad000200     push 0x200ad                             
  0422  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0427  83c404           add sp, 4                                
  042a  6668ae000200     push 0x200ae                             
  0430  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0435  83c404           add sp, 4                                
  0438  6668af000200     push 0x200af                             
  043e  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0443  83c404           add sp, 4                                
  0446  6668b0000200     push 0x200b0                             
  044c  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0451  83c404           add sp, 4                                
  0454  6668ba000200     push 0x200ba                              ; "%s's Quest"
  045a  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  045f  83c404           add sp, 4                                
  0462  6668bc000200     push 0x200bc                             
  0468  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  046d  83c404           add sp, 4                                
  0470  6668bb000200     push 0x200bb                             
  0476  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  047b  83c404           add sp, 4                                
  047e  6668b1000200     push 0x200b1                             
  0484  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0489  83c404           add sp, 4                                
  048c  6668b2000200     push 0x200b2                             
  0492  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0497  83c404           add sp, 4                                
  049a  6668f0000200     push 0x200f0                             
  04a0  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  04a5  83c404           add sp, 4                                
  04a8  6668f1000200     push 0x200f1                             
  04ae  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  04b3  83c404           add sp, 4                                
  04b6  33f6             xor si, si                               
  04b8  eb11             jmp 0x4cb                                
  04ba  6a02             push 2                                   
  04bc  8bc6             mov ax, si                               
  04be  054001           add ax, 0x140                            
  04c1  50               push ax                                  
  04c2  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  04c7  83c404           add sp, 4                                
  04ca  46               inc si                                   
  04cb  83fe08           cmp si, 8                                
  04ce  7cea             jl 0x4ba                                 
  04d0  6668b7000200     push 0x200b7                             
  04d6  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  04db  83c404           add sp, 4                                
  04de  6668b3000200     push 0x200b3                             
  04e4  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  04e9  83c404           add sp, 4                                
  04ec  6668b4000200     push 0x200b4                              ; "Quest"
  04f2  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  04f7  83c404           add sp, 4                                
  04fa  6668b5000200     push 0x200b5                             
  0500  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0505  83c404           add sp, 4                                
  0508  6668b6000200     push 0x200b6                             
  050e  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0513  83c404           add sp, 4                                
  0516  5e               pop si                                   
  0517  5d               pop bp                                   
  0518  cb               retf                                     

ovl61_0519:  ; ENTRY
  0519  55               push bp                                  
  051a  8bec             mov bp, sp                               
  051c  83ec0c           sub sp, 0xc                              
  051f  56               push si                                  
  0520  57               push di                                  
  0521  c746f80000       mov word ptr [bp - 8], 0                 
  0526  c746f60000       mov word ptr [bp - 0xa], 0               
  052b  c746f40000       mov word ptr [bp - 0xc], 0               
  0530  66833e625e00     cmp dword ptr [0x5e62], 0                
  0536  7405             je 0x53d                                 
  0538  b80100           mov ax, 1                                
  053b  eb02             jmp 0x53f                                
  053d  33c0             xor ax, ax                               
  053f  8bf0             mov si, ax                               
  0541  0bf6             or si, si                                
  0543  7409             je 0x54e                                 
  0545  c41e625e         les bx, ptr [0x5e62]                     
  0549  268b07           mov ax, word ptr es:[bx]                 
  054c  eb02             jmp 0x550                                
  054e  33c0             xor ax, ax                               
  0550  8946fe           mov word ptr [bp - 2], ax                
  0553  0bf6             or si, si                                
  0555  740a             je 0x561                                 
  0557  c41e625e         les bx, ptr [0x5e62]                     
  055b  268b4702         mov ax, word ptr es:[bx + 2]             
  055f  eb02             jmp 0x563                                
  0561  33c0             xor ax, ax                               
  0563  8946fc           mov word ptr [bp - 4], ax                
  0566  8b5efc           mov bx, word ptr [bp - 4]                
  0569  69dbe000         imul bx, bx, 0xe0                        
  056d  8b46fe           mov ax, word ptr [bp - 2]                
  0570  d1e0             shl ax, 1                                
  0572  03d8             add bx, ax                               
  0574  b81d1e           mov ax, 0x1e1d                           
  0577  8ec0             mov es, ax                               
  0579  268a9f0000       mov bl, byte ptr es:[bx]                 
  057e  81e3ff00         and bx, 0xff                             
  0582  b8042c           mov ax, 0x2c04                           
  0585  8ec0             mov es, ax                               
  0587  268a871007       mov al, byte ptr es:[bx + 0x710]         
  058c  98               cwde                                     
  058d  8bf8             mov di, ax                               
  058f  0bf6             or si, si                                
  0591  740b             je 0x59e                                 
  0593  c41e625e         les bx, ptr [0x5e62]                     
  0597  268a4704         mov al, byte ptr es:[bx + 4]             
  059b  98               cwde                                     
  059c  eb03             jmp 0x5a1                                
  059e  b8ffff           mov ax, 0xffff                           
  05a1  8946fa           mov word ptr [bp - 6], ax                
  05a4  b8042c           mov ax, 0x2c04                           
  05a7  8ec0             mov es, ax                               
  05a9  268b0e8101       mov cx, word ptr es:[0x181]              
  05ae  eb35             jmp 0x5e5                                
  05b0  8bd9             mov bx, cx                               
  05b2  6bdb16           imul bx, bx, 0x16                        
  05b5  b81d1e           mov ax, 0x1e1d                           
  05b8  8ec0             mov es, ax                               
  05ba  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  05c0  7523             jne 0x5e5                                
  05c2  8bd9             mov bx, cx                               
  05c4  6bdb16           imul bx, bx, 0x16                        
  05c7  b81d1e           mov ax, 0x1e1d                           
  05ca  8ec0             mov es, ax                               
  05cc  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  05d1  98               cwde                                     
  05d2  ba042c           mov dx, 0x2c04                           
  05d5  8ec2             mov es, dx                               
  05d7  263b061001       cmp ax, word ptr es:[0x110]              
  05dc  7507             jne 0x5e5                                
  05de  c746f80100       mov word ptr [bp - 8], 1                 
  05e3  eb07             jmp 0x5ec                                
  05e5  8bc1             mov ax, cx                               
  05e7  49               dec cx                                   
  05e8  0bc0             or ax, ax                                
  05ea  75c4             jne 0x5b0                                
  05ec  83ff0b           cmp di, 0xb                              
  05ef  755c             jne 0x64d                                
  05f1  33d2             xor dx, dx                               
  05f3  eb4c             jmp 0x641                                
  05f5  8bda             mov bx, dx                               
  05f7  6bdb1f           imul bx, bx, 0x1f                        
  05fa  b8042c           mov ax, 0x2c04                           
  05fd  8ec0             mov es, ax                               
  05ff  268b871108       mov ax, word ptr es:[bx + 0x811]         
  0604  3b46fe           cmp ax, word ptr [bp - 2]                
  0607  7537             jne 0x640                                
  0609  8bda             mov bx, dx                               
  060b  6bdb1f           imul bx, bx, 0x1f                        
  060e  b8042c           mov ax, 0x2c04                           
  0611  8ec0             mov es, ax                               
  0613  268b871308       mov ax, word ptr es:[bx + 0x813]         
  0618  3b46fc           cmp ax, word ptr [bp - 4]                
  061b  7523             jne 0x640                                
  061d  c746f60100       mov word ptr [bp - 0xa], 1               
  0622  8bda             mov bx, dx                               
  0624  6bdb1f           imul bx, bx, 0x1f                        
  0627  b8042c           mov ax, 0x2c04                           
  062a  8ec0             mov es, ax                               
  062c  2680bf290801     cmp byte ptr es:[bx + 0x829], 1          
  0632  7505             jne 0x639                                
  0634  b80100           mov ax, 1                                
  0637  eb02             jmp 0x63b                                
  0639  33c0             xor ax, ax                               
  063b  8946f4           mov word ptr [bp - 0xc], ax              
  063e  eb0d             jmp 0x64d                                
  0640  42               inc dx                                   
  0641  b8042c           mov ax, 0x2c04                           
  0644  8ec0             mov es, ax                               
  0646  2639160f08       cmp word ptr es:[0x80f], dx              
  064b  7fa8             jg 0x5f5                                 
  064d  666800000100     push 0x10000                             
  0653  9aab0e7213       lcall 0x1372, 0xeab                      -> 1372:0eab
  0658  83c404           add sp, 4                                
  065b  666801000100     push 0x10001                             
  0661  9aab0e7213       lcall 0x1372, 0xeab                      -> 1372:0eab
  0666  83c404           add sp, 4                                
  0669  666802000100     push 0x10002                             
  066f  9aab0e7213       lcall 0x1372, 0xeab                      -> 1372:0eab
  0674  83c404           add sp, 4                                
  0677  666803000100     push 0x10003                             
  067d  9aab0e7213       lcall 0x1372, 0xeab                      -> 1372:0eab
  0682  83c404           add sp, 4                                
  0685  666804000100     push 0x10004                             
  068b  9aab0e7213       lcall 0x1372, 0xeab                      -> 1372:0eab
  0690  83c404           add sp, 4                                
  0693  666805000100     push 0x10005                             
  0699  9aab0e7213       lcall 0x1372, 0xeab                      -> 1372:0eab
  069e  83c404           add sp, 4                                
  06a1  666806000100     push 0x10006                             
  06a7  9aab0e7213       lcall 0x1372, 0xeab                      -> 1372:0eab
  06ac  83c404           add sp, 4                                
  06af  666807000100     push 0x10007                             
  06b5  9aab0e7213       lcall 0x1372, 0xeab                      -> 1372:0eab
  06ba  83c404           add sp, 4                                
  06bd  9a4d007f30       lcall 0x307f, 0x4d                       -> ovl49:0e25
  06c2  0bc0             or ax, ax                                
  06c4  750e             jne 0x6d4                                
  06c6  6668f6010000     push 0x1f6                               
  06cc  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  06d1  83c404           add sp, 4                                
  06d4  9a52007f30       lcall 0x307f, 0x52                       -> ovl49:0e42
  06d9  0bc0             or ax, ax                                
  06db  750e             jne 0x6eb                                
  06dd  6668f8010000     push 0x1f8                               
  06e3  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  06e8  83c404           add sp, 4                                
  06eb  b8042c           mov ax, 0x2c04                           
  06ee  8ec0             mov es, ax                               
  06f0  26833e200100     cmp word ptr es:[0x120], 0               
  06f6  740a             je 0x702                                 
  06f8  8ec0             mov es, ax                               
  06fa  26833e300100     cmp word ptr es:[0x130], 0               
  0700  740e             je 0x710                                 
  0702  6668f7010000     push 0x1f7                               
  0708  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  070d  83c404           add sp, 4                                
  0710  0bf6             or si, si                                
  0712  750e             jne 0x722                                
  0714  6668fc010000     push 0x1fc                               
  071a  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  071f  83c404           add sp, 4                                
  0722  0bf6             or si, si                                
  0724  7405             je 0x72b                                 
  0726  83ff09           cmp di, 9                                
  0729  740e             je 0x739                                 
  072b  666807020000     push 0x207                               
  0731  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  0736  83c404           add sp, 4                                
  0739  b8042c           mov ax, 0x2c04                           
  073c  8ec0             mov es, ax                               
  073e  268b1e1001       mov bx, word ptr es:[0x110]              
  0743  d1e3             shl bx, 1                                
  0745  83bfea5d00       cmp word ptr [bx + 0x5dea], 0            
  074a  750e             jne 0x75a                                
  074c  6668fd010000     push 0x1fd                               
  0752  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  0757  83c404           add sp, 4                                
  075a  b8042c           mov ax, 0x2c04                           
  075d  8ec0             mov es, ax                               
  075f  26833e1c0100     cmp word ptr es:[0x11c], 0               
  0765  750e             jne 0x775                                
  0767  666803020000     push 0x203                               
  076d  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  0772  83c404           add sp, 4                                
  0775  837ef800         cmp word ptr [bp - 8], 0                 
  0779  751c             jne 0x797                                
  077b  666805020000     push 0x205                               
  0781  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  0786  83c404           add sp, 4                                
  0789  666808020000     push 0x208                               
  078f  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  0794  83c404           add sp, 4                                
  0797  0bf6             or si, si                                
  0799  7503             jne 0x79e                                
  079b  e98300           jmp 0x821                                
  079e  837efa1c         cmp word ptr [bp - 6], 0x1c              
  07a2  757d             jne 0x821                                
  07a4  b8042c           mov ax, 0x2c04                           
  07a7  8ec0             mov es, ax                               
  07a9  268b1e1001       mov bx, word ptr es:[0x110]              
  07ae  6bdb1d           imul bx, bx, 0x1d                        
  07b1  b8042c           mov ax, 0x2c04                           
  07b4  8ec0             mov es, ax                               
  07b6  2680bfff0c03     cmp byte ptr es:[bx + 0xcff], 3          
  07bc  7563             jne 0x821                                
  07be  b8042c           mov ax, 0x2c04                           
  07c1  8ec0             mov es, ax                               
  07c3  268b1e1001       mov bx, word ptr es:[0x110]              
  07c8  6bdb1d           imul bx, bx, 0x1d                        
  07cb  b8042c           mov ax, 0x2c04                           
  07ce  8ec0             mov es, ax                               
  07d0  268b87000d       mov ax, word ptr es:[bx + 0xd00]         
  07d5  6bc016           imul ax, ax, 0x16                        
  07d8  ba1d1e           mov dx, 0x1e1d                           
  07db  bb0000           mov bx, 0                                
  07de  03d8             add bx, ax                               
  07e0  81c38088         add bx, 0x8880                           
  07e4  3b16645e         cmp dx, word ptr [0x5e64]                
  07e8  7537             jne 0x821                                
  07ea  3b1e625e         cmp bx, word ptr [0x5e62]                
  07ee  7531             jne 0x821                                
  07f0  8b5efc           mov bx, word ptr [bp - 4]                
  07f3  6bdb70           imul bx, bx, 0x70                        
  07f6  035efe           add bx, word ptr [bp - 2]                
  07f9  b8d919           mov ax, 0x19d9                           
  07fc  8ec0             mov es, ax                               
  07fe  268a870000       mov al, byte ptr es:[bx]                 
  0803  c1e806           shr ax, 6                                
  0806  250100           and ax, 1                                
  0809  0bc0             or ax, ax                                
  080b  7514             jne 0x821                                
  080d  83ff0a           cmp di, 0xa                              
  0810  740f             je 0x821                                 
  0812  83ff0b           cmp di, 0xb                              
  0815  740a             je 0x821                                 
  0817  83ff02           cmp di, 2                                
  081a  7405             je 0x821                                 
  081c  83ff03           cmp di, 3                                
  081f  750e             jne 0x82f                                
  0821  666806020000     push 0x206                               
  0827  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  082c  83c404           add sp, 4                                
  082f  837ef600         cmp word ptr [bp - 0xa], 0               
  0833  7437             je 0x86c                                 
  0835  0bf6             or si, si                                
  0837  7433             je 0x86c                                 
  0839  837efa1c         cmp word ptr [bp - 6], 0x1c              
  083d  7406             je 0x845                                 
  083f  837ef400         cmp word ptr [bp - 0xc], 0               
  0843  7427             je 0x86c                                 
  0845  83ff0b           cmp di, 0xb                              
  0848  7522             jne 0x86c                                
  084a  8b5efc           mov bx, word ptr [bp - 4]                
  084d  69dbe000         imul bx, bx, 0xe0                        
  0851  8b46fe           mov ax, word ptr [bp - 2]                
  0854  d1e0             shl ax, 1                                
  0856  03d8             add bx, ax                               
  0858  b81d1e           mov ax, 0x1e1d                           
  085b  8ec0             mov es, ax                               
  085d  268a870100       mov al, byte ptr es:[bx + 1]             
  0862  c1e806           shr ax, 6                                
  0865  250100           and ax, 1                                
  0868  0bc0             or ax, ax                                
  086a  740e             je 0x87a                                 
  086c  666809020000     push 0x209                               
  0872  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  0877  83c404           add sp, 4                                
  087a  b8042c           mov ax, 0x2c04                           
  087d  8ec0             mov es, ax                               
  087f  268b1e1001       mov bx, word ptr es:[0x110]              
  0884  d1e3             shl bx, 1                                
  0886  83bfea5d00       cmp word ptr [bx + 0x5dea], 0            
  088b  7f2a             jg 0x8b7                                 
  088d  66680c020000     push 0x20c                               
  0893  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  0898  83c404           add sp, 4                                
  089b  66680e020000     push 0x20e                               
  08a1  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  08a6  83c404           add sp, 4                                
  08a9  66680f020000     push 0x20f                               
  08af  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  08b4  83c404           add sp, 4                                
  08b7  0bf6             or si, si                                
  08b9  750e             jne 0x8c9                                
  08bb  666811020000     push 0x211                               
  08c1  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  08c6  83c404           add sp, 4                                
  08c9  90               nop                                      
  08ca  0e               push cs                                  
  08cb  e88d19           call 0x225b                              
  08ce  3d0100           cmp ax, 1                                
  08d1  7538             jne 0x90b                                
  08d3  666812020000     push 0x212                               
  08d9  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  08de  83c404           add sp, 4                                
  08e1  666813020000     push 0x213                               
  08e7  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  08ec  83c404           add sp, 4                                
  08ef  666814020000     push 0x214                               
  08f5  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  08fa  83c404           add sp, 4                                
  08fd  666815020000     push 0x215                               
  0903  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  0908  83c404           add sp, 4                                
  090b  b8042c           mov ax, 0x2c04                           
  090e  8ec0             mov es, ax                               
  0910  26833e5b0100     cmp word ptr es:[0x15b], 0               
  0916  740e             je 0x926                                 
  0918  666817020000     push 0x217                               
  091e  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  0923  83c404           add sp, 4                                
  0926  5f               pop di                                   
  0927  5e               pop si                                   
  0928  c9               leave                                    
  0929  cb               retf                                     

ovl61_092a:  ; ENTRY
  092a  55               push bp                                  
  092b  8bec             mov bp, sp                               
  092d  81ec8c00         sub sp, 0x8c                             
  0931  56               push si                                  
  0932  57               push di                                  
  0933  837e0600         cmp word ptr [bp + 6], 0                 
  0937  7505             jne 0x93e                                
  0939  bf4100           mov di, 0x41                             
  093c  eb03             jmp 0x941                                
  093e  bf4200           mov di, 0x42                             
  0941  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0946  33f6             xor si, si                               
  0948  e9b400           jmp 0x9ff                                
  094b  c646a800         mov byte ptr [bp - 0x58], 0              
  094f  56               push si                                  
  0950  57               push di                                  
  0951  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0956  83c404           add sp, 4                                
  0959  52               push dx                                  
  095a  50               push ax                                  
  095b  1e               push ds                                  
  095c  68e02a           push 0x2ae0                              
  095f  16               push ss                                  
  0960  8d8674ff         lea ax, [bp - 0x8c]                      
  0964  50               push ax                                  
  0965  9a05007b09       lcall 0x97b, 5                           -> 097b:0005
  096a  83c40c           add sp, 0xc                              
  096d  0bc0             or ax, ax                                
  096f  7533             jne 0x9a4                                
  0971  56               push si                                  
  0972  57               push di                                  
  0973  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0978  83c404           add sp, 4                                
  097b  52               push dx                                  
  097c  50               push ax                                  
  097d  666a01           push 1                                   
  0980  9a7500c130       lcall 0x30c1, 0x75                       -> ovl59:051a
  0985  83c404           add sp, 4                                
  0988  52               push dx                                  
  0989  50               push ax                                  
  098a  16               push ss                                  
  098b  8d46b0           lea ax, [bp - 0x50]                      
  098e  50               push ax                                  
  098f  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0994  83c40c           add sp, 0xc                              
  0997  16               push ss                                  
  0998  8d46b0           lea ax, [bp - 0x50]                      
  099b  50               push ax                                  
  099c  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  09a1  83c404           add sp, 4                                
  09a4  83fe02           cmp si, 2                                
  09a7  7d05             jge 0x9ae                                
  09a9  b81100           mov ax, 0x11                             
  09ac  eb03             jmp 0x9b1                                
  09ae  b8f000           mov ax, 0xf0                             
  09b1  50               push ax                                  
  09b2  8bc6             mov ax, si                               
  09b4  bb0200           mov bx, 2                                
  09b7  99               cdq                                      
  09b8  f7fb             idiv bx                                  
  09ba  69d24001         imul dx, dx, 0x140                       
  09be  52               push dx                                  
  09bf  1e               push ds                                  
  09c0  682a34           push 0x342a                              
  09c3  83fe02           cmp si, 2                                
  09c6  7d05             jge 0x9cd                                
  09c8  b8df00           mov ax, 0xdf                             
  09cb  eb03             jmp 0x9d0                                
  09cd  b8f000           mov ax, 0xf0                             
  09d0  50               push ax                                  
  09d1  684001           push 0x140                               
  09d4  83fe02           cmp si, 2                                
  09d7  7d05             jge 0x9de                                
  09d9  b81100           mov ax, 0x11                             
  09dc  eb02             jmp 0x9e0                                
  09de  33c0             xor ax, ax                               
  09e0  50               push ax                                  
  09e1  6a00             push 0                                   
  09e3  16               push ss                                  
  09e4  8d8674ff         lea ax, [bp - 0x8c]                      
  09e8  50               push ax                                  
  09e9  ff1ed469         lcall [0x69d4]                           
  09ed  83c414           add sp, 0x14                             
  09f0  16               push ss                                  
  09f1  8d8674ff         lea ax, [bp - 0x8c]                      
  09f5  50               push ax                                  
  09f6  9a75091210       lcall 0x1012, 0x975                      -> 1012:0975
  09fb  83c404           add sp, 4                                
  09fe  46               inc si                                   
  09ff  83fe04           cmp si, 4                                
  0a02  7d03             jge 0xa07                                
  0a04  e944ff           jmp 0x94b                                
  0a07  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0a0c  5f               pop di                                   
  0a0d  5e               pop si                                   
  0a0e  c9               leave                                    
  0a0f  cb               retf                                     

ovl61_0a10:  ; ENTRY
  0a10  55               push bp                                  
  0a11  8bec             mov bp, sp                               
  0a13  83ec0c           sub sp, 0xc                              
  0a16  56               push si                                  
  0a17  8b7606           mov si, word ptr [bp + 6]                
  0a1a  66ff36b02a       push dword ptr [0x2ab0]                  
  0a1f  16               push ss                                  
  0a20  8d46fc           lea ax, [bp - 4]                         
  0a23  50               push ax                                  
  0a24  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  0a29  83c408           add sp, 8                                
  0a2c  8d46f4           lea ax, [bp - 0xc]                       
  0a2f  16               push ss                                  
  0a30  50               push ax                                  
  0a31  1e               push ds                                  
  0a32  68b02a           push 0x2ab0                              
  0a35  b90800           mov cx, 8                                
  0a38  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  0a3d  33c0             xor ax, ax                               
  0a3f  8946f6           mov word ptr [bp - 0xa], ax              
  0a42  8946f4           mov word ptr [bp - 0xc], ax              
  0a45  0176f6           add word ptr [bp - 0xa], si              
  0a48  8b4608           mov ax, word ptr [bp + 8]                
  0a4b  03c6             add ax, si                               
  0a4d  2946fa           sub word ptr [bp - 6], ax                
  0a50  66ff76fc         push dword ptr [bp - 4]                  
  0a54  8d46f4           lea ax, [bp - 0xc]                       
  0a57  8cd2             mov dx, ss                               
  0a59  b90800           mov cx, 8                                
  0a5c  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0a61  6a19             push 0x19                                
  0a63  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0a68  83c40e           add sp, 0xe                              
  0a6b  5e               pop si                                   
  0a6c  c9               leave                                    
  0a6d  cb               retf                                     

ovl61_0a6e:  ; ENTRY
  0a6e  55               push bp                                  
  0a6f  8bec             mov bp, sp                               
  0a71  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0a76  6a00             push 0                                   
  0a78  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0a7d  59               pop cx                                   
  0a7e  1e               push ds                                  
  0a7f  68b02a           push 0x2ab0                              
  0a82  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  0a87  83c404           add sp, 4                                
  0a8a  1e               push ds                                  
  0a8b  68a82a           push 0x2aa8                              
  0a8e  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  0a93  83c404           add sp, 4                                
  0a96  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0a9b  5d               pop bp                                   
  0a9c  cb               retf                                     

ovl61_0a9d:  ; ENTRY
  0a9d  55               push bp                                  
  0a9e  8bec             mov bp, sp                               
  0aa0  83ec0c           sub sp, 0xc                              
  0aa3  66ff36942a       push dword ptr [0x2a94]                  
  0aa8  16               push ss                                  
  0aa9  8d46fc           lea ax, [bp - 4]                         
  0aac  50               push ax                                  
  0aad  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  0ab2  83c408           add sp, 8                                
  0ab5  8d46f4           lea ax, [bp - 0xc]                       
  0ab8  16               push ss                                  
  0ab9  50               push ax                                  
  0aba  1e               push ds                                  
  0abb  68942a           push 0x2a94                              
  0abe  b90800           mov cx, 8                                
  0ac1  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  0ac6  33c0             xor ax, ax                               
  0ac8  8946f6           mov word ptr [bp - 0xa], ax              
  0acb  8946f4           mov word ptr [bp - 0xc], ax              
  0ace  66ff76fc         push dword ptr [bp - 4]                  
  0ad2  8d46f4           lea ax, [bp - 0xc]                       
  0ad5  8cd2             mov dx, ss                               
  0ad7  b90800           mov cx, 8                                
  0ada  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0adf  6a19             push 0x19                                
  0ae1  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0ae6  83c40e           add sp, 0xe                              
  0ae9  c9               leave                                    
  0aea  cb               retf                                     

ovl61_0aeb:  ; ENTRY
  0aeb  55               push bp                                  
  0aec  8bec             mov bp, sp                               
  0aee  83ec0c           sub sp, 0xc                              
  0af1  66ff369c2a       push dword ptr [0x2a9c]                  
  0af6  16               push ss                                  
  0af7  8d46fc           lea ax, [bp - 4]                         
  0afa  50               push ax                                  
  0afb  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  0b00  83c408           add sp, 8                                
  0b03  8d46f4           lea ax, [bp - 0xc]                       
  0b06  16               push ss                                  
  0b07  50               push ax                                  
  0b08  1e               push ds                                  
  0b09  689c2a           push 0x2a9c                              
  0b0c  b90800           mov cx, 8                                
  0b0f  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  0b14  c746f40000       mov word ptr [bp - 0xc], 0               
  0b19  c746f63c00       mov word ptr [bp - 0xa], 0x3c            
  0b1e  66ff76fc         push dword ptr [bp - 4]                  
  0b22  8d46f4           lea ax, [bp - 0xc]                       
  0b25  8cd2             mov dx, ss                               
  0b27  b90800           mov cx, 8                                
  0b2a  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0b2f  6a19             push 0x19                                
  0b31  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0b36  83c40e           add sp, 0xe                              
  0b39  c9               leave                                    
  0b3a  cb               retf                                     

ovl61_0b3b:  ; ENTRY
  0b3b  55               push bp                                  
  0b3c  8bec             mov bp, sp                               
  0b3e  83ec04           sub sp, 4                                
  0b41  56               push si                                  
  0b42  8b5606           mov dx, word ptr [bp + 6]                
  0b45  8b7608           mov si, word ptr [bp + 8]                
  0b48  66833e625e00     cmp dword ptr [0x5e62], 0                
  0b4e  7503             jne 0xb53                                
  0b50  e9ae02           jmp 0xe01                                
  0b53  0bd2             or dx, dx                                
  0b55  7c03             jl 0xb5a                                 
  0b57  e99400           jmp 0xbee                                
  0b5a  0bf6             or si, si                                
  0b5c  7c03             jl 0xb61                                 
  0b5e  e98d00           jmp 0xbee                                
  0b61  16               push ss                                  
  0b62  8d46fc           lea ax, [bp - 4]                         
  0b65  50               push ax                                  
  0b66  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  0b6b  83c404           add sp, 4                                
  0b6e  837efc10         cmp word ptr [bp - 4], 0x10              
  0b72  7c53             jl 0xbc7                                 
  0b74  817efc7701       cmp word ptr [bp - 4], 0x177             
  0b79  7f4c             jg 0xbc7                                 
  0b7b  837efe1e         cmp word ptr [bp - 2], 0x1e              
  0b7f  7c46             jl 0xbc7                                 
  0b81  817efe8501       cmp word ptr [bp - 2], 0x185             
  0b86  7f3f             jg 0xbc7                                 
  0b88  8b46fc           mov ax, word ptr [bp - 4]                
  0b8b  05f0ff           add ax, 0xfff0                           
  0b8e  bb2800           mov bx, 0x28                             
  0b91  99               cdq                                      
  0b92  f7fb             idiv bx                                  
  0b94  ba042c           mov dx, 0x2c04                           
  0b97  8ec2             mov es, dx                               
  0b99  268b0e7701       mov cx, word ptr es:[0x177]              
  0b9e  03c8             add cx, ax                               
  0ba0  8b46fe           mov ax, word ptr [bp - 2]                
  0ba3  05e2ff           add ax, 0xffe2                           
  0ba6  99               cdq                                      
  0ba7  f7fb             idiv bx                                  
  0ba9  ba042c           mov dx, 0x2c04                           
  0bac  8ec2             mov es, dx                               
  0bae  268b367501       mov si, word ptr es:[0x175]              
  0bb3  03f0             add si, ax                               
  0bb5  c41e625e         les bx, ptr [0x5e62]                     
  0bb9  26390f           cmp word ptr es:[bx], cx                 
  0bbc  7509             jne 0xbc7                                
  0bbe  26397702         cmp word ptr es:[bx + 2], si             
  0bc2  7503             jne 0xbc7                                
  0bc4  e93a02           jmp 0xe01                                
  0bc7  c41e625e         les bx, ptr [0x5e62]                     
  0bcb  26ff7714         push word ptr es:[bx + 0x14]             
  0bcf  26ff7712         push word ptr es:[bx + 0x12]             
  0bd3  9afd018c0c       lcall 0xc8c, 0x1fd                       -> 0c8c:01fd
  0bd8  83c404           add sp, 4                                
  0bdb  0e               push cs                                  
  0bdc  e895f5           call 0x174                               
  0bdf  c706d82affff     mov word ptr [0x2ad8], 0xffff            
  0be5  c706da2affff     mov word ptr [0x2ada], 0xffff            
  0beb  e91302           jmp 0xe01                                
  0bee  83fa10           cmp dx, 0x10                             
  0bf1  7c14             jl 0xc07                                 
  0bf3  81fa7701         cmp dx, 0x177                            
  0bf7  7f0e             jg 0xc07                                 
  0bf9  83fe1e           cmp si, 0x1e                             
  0bfc  7c09             jl 0xc07                                 
  0bfe  81fe8501         cmp si, 0x185                            
  0c02  7f03             jg 0xc07                                 
  0c04  e9af00           jmp 0xcb6                                
  0c07  83fa10           cmp dx, 0x10                             
  0c0a  7d32             jge 0xc3e                                
  0c0c  83fe1e           cmp si, 0x1e                             
  0c0f  7d2d             jge 0xc3e                                
  0c11  b8042c           mov ax, 0x2c04                           
  0c14  8ec0             mov es, ax                               
  0c16  26ff0e7d01       dec word ptr es:[0x17d]                  
  0c1b  b8042c           mov ax, 0x2c04                           
  0c1e  8ec0             mov es, ax                               
  0c20  26ff0e7f01       dec word ptr es:[0x17f]                  
  0c25  b8042c           mov ax, 0x2c04                           
  0c28  8ec0             mov es, ax                               
  0c2a  26ff367f01       push word ptr es:[0x17f]                 
  0c2f  8ec0             mov es, ax                               
  0c31  26ff367d01       push word ptr es:[0x17d]                 
  0c36  9a3e00f930       lcall 0x30f9, 0x3e                       -> ovl64:0629
  0c3b  e9c001           jmp 0xdfe                                
  0c3e  81fa7701         cmp dx, 0x177                            
  0c42  7e11             jle 0xc55                                
  0c44  83fe1e           cmp si, 0x1e                             
  0c47  7d0c             jge 0xc55                                
  0c49  b8042c           mov ax, 0x2c04                           
  0c4c  8ec0             mov es, ax                               
  0c4e  26ff067d01       inc word ptr es:[0x17d]                  
  0c53  eb54             jmp 0xca9                                
  0c55  83fa10           cmp dx, 0x10                             
  0c58  7d12             jge 0xc6c                                
  0c5a  81fe8501         cmp si, 0x185                            
  0c5e  7e0c             jle 0xc6c                                
  0c60  b8042c           mov ax, 0x2c04                           
  0c63  8ec0             mov es, ax                               
  0c65  26ff0e7d01       dec word ptr es:[0x17d]                  
  0c6a  eb3d             jmp 0xca9                                
  0c6c  81fa7701         cmp dx, 0x177                            
  0c70  7e06             jle 0xc78                                
  0c72  81fe8501         cmp si, 0x185                            
  0c76  7fd1             jg 0xc49                                 
  0c78  83fa10           cmp dx, 0x10                             
  0c7b  7d0c             jge 0xc89                                
  0c7d  b8042c           mov ax, 0x2c04                           
  0c80  8ec0             mov es, ax                               
  0c82  26ff0e7d01       dec word ptr es:[0x17d]                  
  0c87  eb9c             jmp 0xc25                                
  0c89  83fe1e           cmp si, 0x1e                             
  0c8c  7c8d             jl 0xc1b                                 
  0c8e  81fa7701         cmp dx, 0x177                            
  0c92  7e0c             jle 0xca0                                
  0c94  b8042c           mov ax, 0x2c04                           
  0c97  8ec0             mov es, ax                               
  0c99  26ff067d01       inc word ptr es:[0x17d]                  
  0c9e  eb85             jmp 0xc25                                
  0ca0  81fe8501         cmp si, 0x185                            
  0ca4  7f03             jg 0xca9                                 
  0ca6  e95801           jmp 0xe01                                
  0ca9  b8042c           mov ax, 0x2c04                           
  0cac  8ec0             mov es, ax                               
  0cae  26ff067f01       inc word ptr es:[0x17f]                  
  0cb3  e96fff           jmp 0xc25                                
  0cb6  8bc2             mov ax, dx                               
  0cb8  05f0ff           add ax, 0xfff0                           
  0cbb  bb2800           mov bx, 0x28                             
  0cbe  99               cdq                                      
  0cbf  f7fb             idiv bx                                  
  0cc1  ba042c           mov dx, 0x2c04                           
  0cc4  8ec2             mov es, dx                               
  0cc6  268b0e7701       mov cx, word ptr es:[0x177]              
  0ccb  03c8             add cx, ax                               
  0ccd  8bc6             mov ax, si                               
  0ccf  05e2ff           add ax, 0xffe2                           
  0cd2  99               cdq                                      
  0cd3  f7fb             idiv bx                                  
  0cd5  ba042c           mov dx, 0x2c04                           
  0cd8  8ec2             mov es, dx                               
  0cda  268b367501       mov si, word ptr es:[0x175]              
  0cdf  03f0             add si, ax                               
  0ce1  390ed82a         cmp word ptr [0x2ad8], cx                
  0ce5  7509             jne 0xcf0                                
  0ce7  3936da2a         cmp word ptr [0x2ada], si                
  0ceb  7503             jne 0xcf0                                
  0ced  e91101           jmp 0xe01                                
  0cf0  890ed82a         mov word ptr [0x2ad8], cx                
  0cf4  8936da2a         mov word ptr [0x2ada], si                
  0cf8  c41e625e         les bx, ptr [0x5e62]                     
  0cfc  26390f           cmp word ptr es:[bx], cx                 
  0cff  7509             jne 0xd0a                                
  0d01  26397702         cmp word ptr es:[bx + 2], si             
  0d05  7503             jne 0xd0a                                
  0d07  e9f700           jmp 0xe01                                
  0d0a  b8042c           mov ax, 0x2c04                           
  0d0d  8ec0             mov es, ax                               
  0d0f  26390e7701       cmp word ptr es:[0x177], cx              
  0d14  751d             jne 0xd33                                
  0d16  8ec0             mov es, ax                               
  0d18  2639367501       cmp word ptr es:[0x175], si              
  0d1d  7514             jne 0xd33                                
  0d1f  8ec0             mov es, ax                               
  0d21  26ff0e7d01       dec word ptr es:[0x17d]                  
  0d26  b8042c           mov ax, 0x2c04                           
  0d29  8ec0             mov es, ax                               
  0d2b  26ff0e7f01       dec word ptr es:[0x17f]                  
  0d30  e9aa00           jmp 0xddd                                
  0d33  b8042c           mov ax, 0x2c04                           
  0d36  8ec0             mov es, ax                               
  0d38  26390e7701       cmp word ptr es:[0x177], cx              
  0d3d  7513             jne 0xd52                                
  0d3f  8ec0             mov es, ax                               
  0d41  2639367901       cmp word ptr es:[0x179], si              
  0d46  750a             jne 0xd52                                
  0d48  8ec0             mov es, ax                               
  0d4a  26ff0e7d01       dec word ptr es:[0x17d]                  
  0d4f  e98100           jmp 0xdd3                                
  0d52  b8042c           mov ax, 0x2c04                           
  0d55  8ec0             mov es, ax                               
  0d57  26390e7b01       cmp word ptr es:[0x17b], cx              
  0d5c  7512             jne 0xd70                                
  0d5e  8ec0             mov es, ax                               
  0d60  2639367501       cmp word ptr es:[0x175], si              
  0d65  7509             jne 0xd70                                
  0d67  8ec0             mov es, ax                               
  0d69  26ff067d01       inc word ptr es:[0x17d]                  
  0d6e  eb63             jmp 0xdd3                                
  0d70  b8042c           mov ax, 0x2c04                           
  0d73  8ec0             mov es, ax                               
  0d75  26390e7b01       cmp word ptr es:[0x17b], cx              
  0d7a  7512             jne 0xd8e                                
  0d7c  8ec0             mov es, ax                               
  0d7e  2639367901       cmp word ptr es:[0x179], si              
  0d83  7509             jne 0xd8e                                
  0d85  8ec0             mov es, ax                               
  0d87  26ff067d01       inc word ptr es:[0x17d]                  
  0d8c  eb98             jmp 0xd26                                
  0d8e  b8042c           mov ax, 0x2c04                           
  0d91  8ec0             mov es, ax                               
  0d93  26390e7701       cmp word ptr es:[0x177], cx              
  0d98  7509             jne 0xda3                                
  0d9a  8ec0             mov es, ax                               
  0d9c  26ff0e7d01       dec word ptr es:[0x17d]                  
  0da1  eb3a             jmp 0xddd                                
  0da3  b8042c           mov ax, 0x2c04                           
  0da6  8ec0             mov es, ax                               
  0da8  26390e7b01       cmp word ptr es:[0x17b], cx              
  0dad  7509             jne 0xdb8                                
  0daf  8ec0             mov es, ax                               
  0db1  26ff067d01       inc word ptr es:[0x17d]                  
  0db6  eb25             jmp 0xddd                                
  0db8  b8042c           mov ax, 0x2c04                           
  0dbb  8ec0             mov es, ax                               
  0dbd  2639367501       cmp word ptr es:[0x175], si              
  0dc2  7503             jne 0xdc7                                
  0dc4  e95fff           jmp 0xd26                                
  0dc7  b8042c           mov ax, 0x2c04                           
  0dca  8ec0             mov es, ax                               
  0dcc  2639367901       cmp word ptr es:[0x179], si              
  0dd1  7523             jne 0xdf6                                
  0dd3  b8042c           mov ax, 0x2c04                           
  0dd6  8ec0             mov es, ax                               
  0dd8  26ff067f01       inc word ptr es:[0x17f]                  
  0ddd  b8042c           mov ax, 0x2c04                           
  0de0  8ec0             mov es, ax                               
  0de2  26ff367f01       push word ptr es:[0x17f]                 
  0de7  8ec0             mov es, ax                               
  0de9  26ff367d01       push word ptr es:[0x17d]                 
  0dee  9a3e00f930       lcall 0x30f9, 0x3e                       -> ovl64:0629
  0df3  83c404           add sp, 4                                
  0df6  666a01           push 1                                   
  0df9  9a07008c0c       lcall 0xc8c, 7                           -> 0c8c:0007
  0dfe  83c404           add sp, 4                                
  0e01  5e               pop si                                   
  0e02  c9               leave                                    
  0e03  cb               retf                                     

ovl61_0e04:  ; ENTRY
  0e04  55               push bp                                  
  0e05  8bec             mov bp, sp                               
  0e07  83ec08           sub sp, 8                                
  0e0a  833e761100       cmp word ptr [0x1176], 0                 
  0e0f  753e             jne 0xe4f                                
  0e11  b8042c           mov ax, 0x2c04                           
  0e14  8ec0             mov es, ax                               
  0e16  26a17d01         mov ax, word ptr es:[0x17d]              
  0e1a  a3c05d           mov word ptr [0x5dc0], ax                
  0e1d  b8042c           mov ax, 0x2c04                           
  0e20  8ec0             mov es, ax                               
  0e22  26a17f01         mov ax, word ptr es:[0x17f]              
  0e26  a3c25d           mov word ptr [0x5dc2], ax                
  0e29  16               push ss                                  
  0e2a  8d46f8           lea ax, [bp - 8]                         
  0e2d  50               push ax                                  
  0e2e  16               push ss                                  
  0e2f  8d46fa           lea ax, [bp - 6]                         
  0e32  50               push ax                                  
  0e33  9a0c0bbf12       lcall 0x12bf, 0xb0c                      -> 12bf:0b0c
  0e38  83c408           add sp, 8                                
  0e3b  66c706b85d000000 mov dword ptr [0x5db8], 0                
  0e44  66c706bc5d000000 mov dword ptr [0x5dbc], 0                
  0e4d  eb78             jmp 0xec7                                
  0e4f  16               push ss                                  
  0e50  8d46f8           lea ax, [bp - 8]                         
  0e53  50               push ax                                  
  0e54  16               push ss                                  
  0e55  8d46fa           lea ax, [bp - 6]                         
  0e58  50               push ax                                  
  0e59  9a0c0bbf12       lcall 0x12bf, 0xb0c                      -> 12bf:0b0c
  0e5e  83c408           add sp, 8                                
  0e61  660fbf46fa       movsx eax, word ptr [bp - 6]             
  0e66  662906b85d       sub dword ptr [0x5db8], eax              
  0e6b  8b46f8           mov ax, word ptr [bp - 8]                
  0e6e  99               cdq                                      
  0e6f  2bc2             sub ax, dx                               
  0e71  d1f8             sar ax, 1                                
  0e73  660fbfc0         movsx eax, ax                            
  0e77  662906bc5d       sub dword ptr [0x5dbc], eax              
  0e7c  66a1b85d         mov eax, dword ptr [0x5db8]              
  0e80  66bb28000000     mov ebx, 0x28                            
  0e86  6699             cdq                                      
  0e88  66f7fb           idiv ebx                                 
  0e8b  8946fe           mov word ptr [bp - 2], ax                
  0e8e  66a1bc5d         mov eax, dword ptr [0x5dbc]              
  0e92  6699             cdq                                      
  0e94  66f7fb           idiv ebx                                 
  0e97  8946fc           mov word ptr [bp - 4], ax                
  0e9a  8b16c05d         mov dx, word ptr [0x5dc0]                
  0e9e  0356fe           add dx, word ptr [bp - 2]                
  0ea1  8b1ec25d         mov bx, word ptr [0x5dc2]                
  0ea5  035efc           add bx, word ptr [bp - 4]                
  0ea8  b8042c           mov ax, 0x2c04                           
  0eab  8ec0             mov es, ax                               
  0ead  2639167d01       cmp word ptr es:[0x17d], dx              
  0eb2  7509             jne 0xebd                                
  0eb4  8ec0             mov es, ax                               
  0eb6  26391e7f01       cmp word ptr es:[0x17f], bx              
  0ebb  740a             je 0xec7                                 
  0ebd  53               push bx                                  
  0ebe  52               push dx                                  
  0ebf  9a3e00f930       lcall 0x30f9, 0x3e                       -> ovl64:0629
  0ec4  83c404           add sp, 4                                
  0ec7  c9               leave                                    
  0ec8  cb               retf                                     

ovl61_0ec9:  ; ENTRY
  0ec9  55               push bp                                  
  0eca  8bec             mov bp, sp                               
  0ecc  9a2a001931       lcall 0x3119, 0x2a                       -> ovl67:019b
  0ed1  0e               push cs                                  
  0ed2  e89ff2           call 0x174                               
  0ed5  5d               pop bp                                   
  0ed6  cb               retf                                     

ovl61_0ed7:  ; ENTRY
  0ed7  55               push bp                                  
  0ed8  8bec             mov bp, sp                               
  0eda  66833e625e00     cmp dword ptr [0x5e62], 0                
  0ee0  7507             jne 0xee9                                
  0ee2  9a2a001931       lcall 0x3119, 0x2a                       -> ovl67:019b
  0ee7  eb05             jmp 0xeee                                
  0ee9  9a34001931       lcall 0x3119, 0x34                       -> ovl67:0393
  0eee  0e               push cs                                  
  0eef  e882f2           call 0x174                               
  0ef2  5d               pop bp                                   
  0ef3  cb               retf                                     

ovl61_0ef4:  ; ENTRY
  0ef4  55               push bp                                  
  0ef5  8bec             mov bp, sp                               
  0ef7  9a39001931       lcall 0x3119, 0x39                       -> ovl67:03a6
  0efc  0e               push cs                                  
  0efd  e874f2           call 0x174                               
  0f00  5d               pop bp                                   
  0f01  cb               retf                                     

ovl61_0f02:  ; ENTRY
  0f02  55               push bp                                  
  0f03  8bec             mov bp, sp                               
  0f05  66833e625e00     cmp dword ptr [0x5e62], 0                
  0f0b  7417             je 0xf24                                 
  0f0d  c41e625e         les bx, ptr [0x5e62]                     
  0f11  26ff7702         push word ptr es:[bx + 2]                
  0f15  26ff37           push word ptr es:[bx]                    
  0f18  9a3e00f930       lcall 0x30f9, 0x3e                       -> ovl64:0629
  0f1d  83c404           add sp, 4                                
  0f20  0e               push cs                                  
  0f21  e850f2           call 0x174                               
  0f24  5d               pop bp                                   
  0f25  cb               retf                                     

ovl61_0f26:  ; ENTRY
  0f26  55               push bp                                  
  0f27  8bec             mov bp, sp                               
  0f29  666801000100     push 0x10001                             
  0f2f  6a01             push 1                                   
  0f31  9ab308620b       lcall 0xb62, 0x8b3                       -> 0b62:08b3
  0f36  83c406           add sp, 6                                
  0f39  0e               push cs                                  
  0f3a  e837f2           call 0x174                               
  0f3d  5d               pop bp                                   
  0f3e  cb               retf                                     

ovl61_0f3f:  ; ENTRY
  0f3f  55               push bp                                  
  0f40  8bec             mov bp, sp                               
  0f42  66833e625e00     cmp dword ptr [0x5e62], 0                
  0f48  747e             je 0xfc8                                 
  0f4a  c41e625e         les bx, ptr [0x5e62]                     
  0f4e  26837f1200       cmp word ptr es:[bx + 0x12], 0           
  0f53  7c73             jl 0xfc8                                 
  0f55  26837f1400       cmp word ptr es:[bx + 0x14], 0           
  0f5a  7c6c             jl 0xfc8                                 
  0f5c  268b07           mov ax, word ptr es:[bx]                 
  0f5f  ba042c           mov dx, 0x2c04                           
  0f62  8ec2             mov es, dx                               
  0f64  263b067701       cmp ax, word ptr es:[0x177]              
  0f69  7c65             jl 0xfd0                                 
  0f6b  8e06645e         mov es, word ptr [0x5e64]                
  0f6f  8ec2             mov es, dx                               
  0f71  263b067b01       cmp ax, word ptr es:[0x17b]              
  0f76  7f58             jg 0xfd0                                 
  0f78  8e06645e         mov es, word ptr [0x5e64]                
  0f7c  268b4702         mov ax, word ptr es:[bx + 2]             
  0f80  8ec2             mov es, dx                               
  0f82  263b067501       cmp ax, word ptr es:[0x175]              
  0f87  7c47             jl 0xfd0                                 
  0f89  8e06645e         mov es, word ptr [0x5e64]                
  0f8d  8ec2             mov es, dx                               
  0f8f  263b067901       cmp ax, word ptr es:[0x179]              
  0f94  7f3a             jg 0xfd0                                 
  0f96  8e06645e         mov es, word ptr [0x5e64]                
  0f9a  268b4712         mov ax, word ptr es:[bx + 0x12]          
  0f9e  8ec2             mov es, dx                               
  0fa0  263b067d01       cmp ax, word ptr es:[0x17d]              
  0fa5  7511             jne 0xfb8                                
  0fa7  8e06645e         mov es, word ptr [0x5e64]                
  0fab  268b4714         mov ax, word ptr es:[bx + 0x14]          
  0faf  8ec2             mov es, dx                               
  0fb1  263b067f01       cmp ax, word ptr es:[0x17f]              
  0fb6  7418             je 0xfd0                                 
  0fb8  c41e625e         les bx, ptr [0x5e62]                     
  0fbc  26ff7714         push word ptr es:[bx + 0x14]             
  0fc0  26ff7712         push word ptr es:[bx + 0x12]             
  0fc4  eb15             jmp 0xfdb                                
  0fc6  eb08             jmp 0xfd0                                
  0fc8  66833e625e00     cmp dword ptr [0x5e62], 0                
  0fce  7413             je 0xfe3                                 
  0fd0  c41e625e         les bx, ptr [0x5e62]                     
  0fd4  26ff7702         push word ptr es:[bx + 2]                
  0fd8  26ff37           push word ptr es:[bx]                    
  0fdb  9a3e00f930       lcall 0x30f9, 0x3e                       -> ovl64:0629
  0fe0  83c404           add sp, 4                                
  0fe3  0e               push cs                                  
  0fe4  e88df1           call 0x174                               
  0fe7  5d               pop bp                                   
  0fe8  cb               retf                                     

ovl61_0fe9:  ; ENTRY
  0fe9  55               push bp                                  
  0fea  8bec             mov bp, sp                               
  0fec  66833e625e00     cmp dword ptr [0x5e62], 0                
  0ff2  7454             je 0x1048                                
  0ff4  c41e625e         les bx, ptr [0x5e62]                     
  0ff8  26837f1200       cmp word ptr es:[bx + 0x12], 0           
  0ffd  7c49             jl 0x1048                                
  0fff  26837f1400       cmp word ptr es:[bx + 0x14], 0           
  1004  7c42             jl 0x1048                                
  1006  33d2             xor dx, dx                               
  1008  eb2e             jmp 0x1038                               
  100a  8bda             mov bx, dx                               
  100c  c1e302           shl bx, 2                                
  100f  8b873e5e         mov ax, word ptr [bx + 0x5e3e]           
  1013  0b87405e         or ax, word ptr [bx + 0x5e40]            
  1017  741e             je 0x1037                                
  1019  8bda             mov bx, dx                               
  101b  c1e302           shl bx, 2                                
  101e  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  1022  26c74712ffff     mov word ptr es:[bx + 0x12], 0xffff      
  1028  8bda             mov bx, dx                               
  102a  c1e302           shl bx, 2                                
  102d  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  1031  26c74714ffff     mov word ptr es:[bx + 0x14], 0xffff      
  1037  42               inc dx                                   
  1038  83fa08           cmp dx, 8                                
  103b  7ccd             jl 0x100a                                
  103d  c706a62e0000     mov word ptr [0x2ea6], 0                 
  1043  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  1048  0e               push cs                                  
  1049  e828f1           call 0x174                               
  104c  5d               pop bp                                   
  104d  cb               retf                                     

ovl61_104e:  ; ENTRY
  104e  55               push bp                                  
  104f  8bec             mov bp, sp                               
  1051  1e               push ds                                  
  1052  68e12a           push 0x2ae1                               ; "HELP\HMOUSE.GFX"
  1055  90               nop                                      
  1056  0e               push cs                                  
  1057  e89b06           call 0x16f5                              
  105a  83c404           add sp, 4                                
  105d  1e               push ds                                  
  105e  68f12a           push 0x2af1                               ; "HELP\HKEYS.GFX"
  1061  90               nop                                      
  1062  0e               push cs                                  
  1063  e88f06           call 0x16f5                              
  1066  83c404           add sp, 4                                
  1069  0e               push cs                                  
  106a  e807f1           call 0x174                               
  106d  5d               pop bp                                   
  106e  cb               retf                                     

ovl61_106f:  ; ENTRY
  106f  55               push bp                                  
  1070  8bec             mov bp, sp                               
  1072  56               push si                                  
  1073  57               push di                                  
  1074  666800000300     push 0x30000                             
  107a  666802000f00     push 0xf0002                             
  1080  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1085  83c408           add sp, 8                                
  1088  a1982a           mov ax, word ptr [0x2a98]                
  108b  99               cdq                                      
  108c  2bc2             sub ax, dx                               
  108e  d1f8             sar ax, 1                                
  1090  8b36942a         mov si, word ptr [0x2a94]                
  1094  03f0             add si, ax                               
  1096  8b3e962a         mov di, word ptr [0x2a96]                
  109a  83c704           add di, 4                                
  109d  66ff7606         push dword ptr [bp + 6]                  
  10a1  57               push di                                  
  10a2  56               push si                                  
  10a3  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  10a8  83c408           add sp, 8                                
  10ab  66ff760a         push dword ptr [bp + 0xa]                
  10af  8bc7             mov ax, di                               
  10b1  051400           add ax, 0x14                             
  10b4  50               push ax                                  
  10b5  56               push si                                  
  10b6  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  10bb  83c408           add sp, 8                                
  10be  66ff760e         push dword ptr [bp + 0xe]                
  10c2  8bc7             mov ax, di                               
  10c4  052800           add ax, 0x28                             
  10c7  50               push ax                                  
  10c8  56               push si                                  
  10c9  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  10ce  83c408           add sp, 8                                
  10d1  66ff7612         push dword ptr [bp + 0x12]               
  10d5  8bc7             mov ax, di                               
  10d7  053c00           add ax, 0x3c                             
  10da  50               push ax                                  
  10db  56               push si                                  
  10dc  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  10e1  83c408           add sp, 8                                
  10e4  66ff7616         push dword ptr [bp + 0x16]               
  10e8  8bc7             mov ax, di                               
  10ea  055000           add ax, 0x50                             
  10ed  50               push ax                                  
  10ee  56               push si                                  
  10ef  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  10f4  83c408           add sp, 8                                
  10f7  5f               pop di                                   
  10f8  5e               pop si                                   
  10f9  5d               pop bp                                   
  10fa  cb               retf                                     

ovl61_10fb:  ; ENTRY
  10fb  55               push bp                                  
  10fc  8bec             mov bp, sp                               
  10fe  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  1103  66837e0600       cmp dword ptr [bp + 6], 0                
  1108  742d             je 0x1137                                
  110a  6a05             push 5                                   
  110c  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  1111  59               pop cx                                   
  1112  666800000300     push 0x30000                             
  1118  666802000f00     push 0xf0002                             
  111e  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1123  83c408           add sp, 8                                
  1126  66ff7606         push dword ptr [bp + 6]                  
  112a  66ff36cc2a       push dword ptr [0x2acc]                  
  112f  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1134  83c408           add sp, 8                                
  1137  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  113c  c7066a160100     mov word ptr [0x166a], 1                 
  1142  9a2000c130       lcall 0x30c1, 0x20                       -> ovl59:0142
  1147  c7066a160000     mov word ptr [0x166a], 0                 
  114d  66837e0600       cmp dword ptr [bp + 6], 0                
  1152  7405             je 0x1159                                
  1154  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  1159  9a6100c130       lcall 0x30c1, 0x61                       -> ovl59:01f1
  115e  5d               pop bp                                   
  115f  cb               retf                                     

ovl61_1160:  ; ENTRY
  1160  55               push bp                                  
  1161  8bec             mov bp, sp                               
  1163  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  1168  6a05             push 5                                   
  116a  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  116f  59               pop cx                                   
  1170  666800000300     push 0x30000                             
  1176  666802000f00     push 0xf0002                             
  117c  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1181  83c408           add sp, 8                                
  1184  66837e0600       cmp dword ptr [bp + 6], 0                
  1189  7411             je 0x119c                                
  118b  66ff7606         push dword ptr [bp + 6]                  
  118f  66ff36d02a       push dword ptr [0x2ad0]                  
  1194  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1199  83c408           add sp, 8                                
  119c  66837e0a00       cmp dword ptr [bp + 0xa], 0              
  11a1  7411             je 0x11b4                                
  11a3  66ff760a         push dword ptr [bp + 0xa]                
  11a7  66ff36d42a       push dword ptr [0x2ad4]                  
  11ac  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  11b1  83c408           add sp, 8                                
  11b4  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  11b9  c7066a160100     mov word ptr [0x166a], 1                 
  11bf  9a2000c130       lcall 0x30c1, 0x20                       -> ovl59:0142
  11c4  c7066a160000     mov word ptr [0x166a], 0                 
  11ca  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  11cf  5d               pop bp                                   
  11d0  cb               retf                                     

ovl61_11d1:  ; ENTRY
  11d1  55               push bp                                  
  11d2  8bec             mov bp, sp                               
  11d4  83ec0c           sub sp, 0xc                              
  11d7  56               push si                                  
  11d8  8b760a           mov si, word ptr [bp + 0xa]              
  11db  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  11e0  66ff369c2a       push dword ptr [0x2a9c]                  
  11e5  16               push ss                                  
  11e6  8d46fc           lea ax, [bp - 4]                         
  11e9  50               push ax                                  
  11ea  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  11ef  83c408           add sp, 8                                
  11f2  8d46f4           lea ax, [bp - 0xc]                       
  11f5  16               push ss                                  
  11f6  50               push ax                                  
  11f7  1e               push ds                                  
  11f8  689c2a           push 0x2a9c                              
  11fb  b90800           mov cx, 8                                
  11fe  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  1203  c746f40000       mov word ptr [bp - 0xc], 0               
  1208  c746f63c00       mov word ptr [bp - 0xa], 0x3c            
  120d  a1a62a           mov ax, word ptr [0x2aa6]                
  1210  2b069e2a         sub ax, word ptr [0x2a9e]                
  1214  051400           add ax, 0x14                             
  1217  8946fa           mov word ptr [bp - 6], ax                
  121a  66ff76fc         push dword ptr [bp - 4]                  
  121e  8d46f4           lea ax, [bp - 0xc]                       
  1221  8cd2             mov dx, ss                               
  1223  b90800           mov cx, 8                                
  1226  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  122b  6a19             push 0x19                                
  122d  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  1232  83c40e           add sp, 0xe                              
  1235  6a03             push 3                                   
  1237  b8042c           mov ax, 0x2c04                           
  123a  8ec0             mov es, ax                               
  123c  268b1e1001       mov bx, word ptr es:[0x110]              
  1241  d1e3             shl bx, 1                                
  1243  b8042c           mov ax, 0x2c04                           
  1246  8ec0             mov es, ax                               
  1248  26ffb7b000       push word ptr es:[bx + 0xb0]             
  124d  b8042c           mov ax, 0x2c04                           
  1250  8ec0             mov es, ax                               
  1252  268b1e1001       mov bx, word ptr es:[0x110]              
  1257  d1e3             shl bx, 1                                
  1259  b8042c           mov ax, 0x2c04                           
  125c  8ec0             mov es, ax                               
  125e  26ffb7a000       push word ptr es:[bx + 0xa0]             
  1263  6a02             push 2                                   
  1265  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  126a  83c408           add sp, 8                                
  126d  66ff7606         push dword ptr [bp + 6]                  
  1271  66ff36a42a       push dword ptr [0x2aa4]                  
  1276  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  127b  83c408           add sp, 8                                
  127e  0bf6             or si, si                                
  1280  7e07             jle 0x1289                               
  1282  56               push si                                  
  1283  9a4800c130       lcall 0x30c1, 0x48                       -> ovl59:0000
  1288  59               pop cx                                   
  1289  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  128e  5e               pop si                                   
  128f  c9               leave                                    
  1290  cb               retf                                     

ovl61_1291:  ; ENTRY
  1291  55               push bp                                  
  1292  8bec             mov bp, sp                               
  1294  83ec0c           sub sp, 0xc                              
  1297  66681800b301     push 0x1b30018                           
  129d  16               push ss                                  
  129e  8d46f4           lea ax, [bp - 0xc]                       
  12a1  50               push ax                                  
  12a2  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  12a7  83c408           add sp, 8                                
  12aa  666860011f00     push 0x1f0160                            
  12b0  b8bc01           mov ax, 0x1bc                            
  12b3  2b069e2a         sub ax, word ptr [0x2a9e]                
  12b7  053300           add ax, 0x33                             
  12ba  50               push ax                                  
  12bb  b82800           mov ax, 0x28                             
  12be  2b069c2a         sub ax, word ptr [0x2a9c]                
  12c2  05f0ff           add ax, 0xfff0                           
  12c5  50               push ax                                  
  12c6  16               push ss                                  
  12c7  8d46f8           lea ax, [bp - 8]                         
  12ca  50               push ax                                  
  12cb  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  12d0  83c40c           add sp, 0xc                              
  12d3  66ff76f4         push dword ptr [bp - 0xc]                
  12d7  8d46f8           lea ax, [bp - 8]                         
  12da  8cd2             mov dx, ss                               
  12dc  b90800           mov cx, 8                                
  12df  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  12e4  6a19             push 0x19                                
  12e6  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  12eb  83c40e           add sp, 0xe                              
  12ee  6a00             push 0                                   
  12f0  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  12f5  59               pop cx                                   
  12f6  666840011600     push 0x160140                            
  12fc  66682400ba01     push 0x1ba0024                           
  1302  16               push ss                                  
  1303  8d46f8           lea ax, [bp - 8]                         
  1306  50               push ax                                  
  1307  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  130c  83c40c           add sp, 0xc                              
  130f  52               push dx                                  
  1310  50               push ax                                  
  1311  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  1316  83c404           add sp, 4                                
  1319  c9               leave                                    
  131a  cb               retf                                     

ovl61_131b:  ; ENTRY
  131b  55               push bp                                  
  131c  8bec             mov bp, sp                               
  131e  83ec0e           sub sp, 0xe                              
  1321  8b4606           mov ax, word ptr [bp + 6]                
  1324  bb0500           mov bx, 5                                
  1327  99               cdq                                      
  1328  f7fb             idiv bx                                  
  132a  8946f2           mov word ptr [bp - 0xe], ax              
  132d  6a12             push 0x12                                
  132f  c1e004           shl ax, 4                                
  1332  50               push ax                                  
  1333  666a00           push 0                                   
  1336  16               push ss                                  
  1337  8d46f8           lea ax, [bp - 8]                         
  133a  50               push ax                                  
  133b  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  1340  83c40c           add sp, 0xc                              
  1343  66682000bc01     push 0x1bc0020                           
  1349  16               push ss                                  
  134a  8d46f4           lea ax, [bp - 0xc]                       
  134d  50               push ax                                  
  134e  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  1353  83c408           add sp, 8                                
  1356  66ff76f4         push dword ptr [bp - 0xc]                
  135a  8d46f8           lea ax, [bp - 8]                         
  135d  8cd2             mov dx, ss                               
  135f  b90800           mov cx, 8                                
  1362  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  1367  b8042c           mov ax, 0x2c04                           
  136a  8ec0             mov es, ax                               
  136c  26a11001         mov ax, word ptr es:[0x110]              
  1370  054700           add ax, 0x47                             
  1373  50               push ax                                  
  1374  9a7e029709       lcall 0x997, 0x27e                       -> 0997:027e
  1379  83c40e           add sp, 0xe                              
  137c  c9               leave                                    
  137d  cb               retf                                     

ovl61_137e:  ; ENTRY
  137e  55               push bp                                  
  137f  8bec             mov bp, sp                               
  1381  83ec04           sub sp, 4                                
  1384  9a3400ac2f       lcall 0x2fac, 0x34                       -> ovl17:08bf
  1389  a3dc2a           mov word ptr [0x2adc], ax                
  138c  833edc2a00       cmp word ptr [0x2adc], 0                 
  1391  7430             je 0x13c3                                
  1393  16               push ss                                  
  1394  8d46fc           lea ax, [bp - 4]                         
  1397  50               push ax                                  
  1398  16               push ss                                  
  1399  8d46fe           lea ax, [bp - 2]                         
  139c  50               push ax                                  
  139d  9a3e00ac2f       lcall 0x2fac, 0x3e                       -> ovl17:08f6
  13a2  83c408           add sp, 8                                
  13a5  6668f8006900     push 0x6900f8                            
  13ab  b8af00           mov ax, 0xaf                             
  13ae  2b46fc           sub ax, word ptr [bp - 4]                
  13b1  50               push ax                                  
  13b2  b8c800           mov ax, 0xc8                              ; "Quest"
  13b5  2b46fe           sub ax, word ptr [bp - 2]                
  13b8  50               push ax                                  
  13b9  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  13be  83c408           add sp, 8                                
  13c1  eb08             jmp 0x13cb                               
  13c3  6a17             push 0x17                                
  13c5  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  13ca  59               pop cx                                   
  13cb  66688a000600     push 0x6008a                             
  13d1  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  13d6  83c404           add sp, 4                                
  13d9  52               push dx                                  
  13da  50               push ax                                  
  13db  66688a000500     push 0x5008a                             
  13e1  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  13e6  83c404           add sp, 4                                
  13e9  52               push dx                                  
  13ea  50               push ax                                  
  13eb  66688a000400     push 0x4008a                             
  13f1  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  13f6  83c404           add sp, 4                                
  13f9  52               push dx                                  
  13fa  50               push ax                                  
  13fb  66688a000300     push 0x3008a                             
  1401  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1406  83c404           add sp, 4                                
  1409  52               push dx                                  
  140a  50               push ax                                  
  140b  66688a000200     push 0x2008a                             
  1411  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1416  83c404           add sp, 4                                
  1419  52               push dx                                  
  141a  50               push ax                                  
  141b  66688a000100     push 0x1008a                             
  1421  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1426  83c404           add sp, 4                                
  1429  52               push dx                                  
  142a  50               push ax                                  
  142b  66688a000000     push 0x8a                                
  1431  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1436  83c404           add sp, 4                                
  1439  52               push dx                                  
  143a  50               push ax                                  
  143b  90               nop                                      
  143c  0e               push cs                                  
  143d  e83100           call 0x1471                              
  1440  83c41c           add sp, 0x1c                             
  1443  9a4300622f       lcall 0x2f62, 0x43                       -> ovl02:01b5
  1448  6a00             push 0                                   
  144a  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  144f  59               pop cx                                   
  1450  c9               leave                                    
  1451  cb               retf                                     

ovl61_1452:  ; ENTRY
  1452  55               push bp                                  
  1453  8bec             mov bp, sp                               
  1455  833edc2a00       cmp word ptr [0x2adc], 0                 
  145a  7505             jne 0x1461                               
  145c  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  1461  5d               pop bp                                   
  1462  cb               retf                                     

ovl61_1463:  ; ENTRY
  1463  55               push bp                                  
  1464  8bec             mov bp, sp                               
  1466  ff7606           push word ptr [bp + 6]                   
  1469  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  146e  59               pop cx                                   
  146f  5d               pop bp                                   
  1470  cb               retf                                     

ovl61_1471:  ; ENTRY
  1471  55               push bp                                  
  1472  8bec             mov bp, sp                               
  1474  56               push si                                  
  1475  666807000100     push 0x10007                             
  147b  666a02           push 2                                   
  147e  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1483  83c408           add sp, 8                                
  1486  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  148b  9a4300ac2f       lcall 0x2fac, 0x43                       -> ovl17:093a
  1490  3d0d00           cmp ax, 0xd                              
  1493  7403             je 0x1498                                
  1495  e92101           jmp 0x15b9                               
  1498  66837e0600       cmp dword ptr [bp + 6], 0                
  149d  7450             je 0x14ef                                
  149f  c45e06           les bx, ptr [bp + 6]                     
  14a2  26803f00         cmp byte ptr es:[bx], 0                  
  14a6  7447             je 0x14ef                                
  14a8  ff7608           push word ptr [bp + 8]                   
  14ab  53               push bx                                  
  14ac  9a8e0ae211       lcall 0x11e2, 0xa8e                      -> 11e2:0a8e
  14b1  83c404           add sp, 4                                
  14b4  8bf0             mov si, ax                               
  14b6  6a00             push 0                                   
  14b8  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  14bd  59               pop cx                                   
  14be  8bc6             mov ax, si                               
  14c0  050200           add ax, 2                                
  14c3  50               push ax                                  
  14c4  689d00           push 0x9d                                
  14c7  8bc6             mov ax, si                               
  14c9  99               cdq                                      
  14ca  2bc2             sub ax, dx                               
  14cc  d1f8             sar ax, 1                                
  14ce  ba4801           mov dx, 0x148                            
  14d1  2bd0             sub dx, ax                               
  14d3  4a               dec dx                                   
  14d4  52               push dx                                  
  14d5  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  14da  83c406           add sp, 6                                
  14dd  66ff7606         push dword ptr [bp + 6]                  
  14e1  666848018c00     push 0x8c0148                            
  14e7  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  14ec  83c408           add sp, 8                                
  14ef  66837e0a00       cmp dword ptr [bp + 0xa], 0              
  14f4  741b             je 0x1511                                
  14f6  c45e0a           les bx, ptr [bp + 0xa]                   
  14f9  26803f00         cmp byte ptr es:[bx], 0                  
  14fd  7412             je 0x1511                                
  14ff  ff760c           push word ptr [bp + 0xc]                 
  1502  53               push bx                                  
  1503  66684801a500     push 0xa50148                            
  1509  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  150e  83c408           add sp, 8                                
  1511  66837e0e00       cmp dword ptr [bp + 0xe], 0              
  1516  741b             je 0x1533                                
  1518  c45e0e           les bx, ptr [bp + 0xe]                   
  151b  26803f00         cmp byte ptr es:[bx], 0                  
  151f  7412             je 0x1533                                
  1521  ff7610           push word ptr [bp + 0x10]                
  1524  53               push bx                                  
  1525  66684801b900     push 0xb90148                            
  152b  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1530  83c408           add sp, 8                                
  1533  66837e1200       cmp dword ptr [bp + 0x12], 0             
  1538  741b             je 0x1555                                
  153a  c45e12           les bx, ptr [bp + 0x12]                  
  153d  26803f00         cmp byte ptr es:[bx], 0                  
  1541  7412             je 0x1555                                
  1543  ff7614           push word ptr [bp + 0x14]                
  1546  53               push bx                                  
  1547  66684801cd00     push 0xcd0148                            
  154d  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1552  83c408           add sp, 8                                
  1555  66837e1600       cmp dword ptr [bp + 0x16], 0             
  155a  741b             je 0x1577                                
  155c  c45e16           les bx, ptr [bp + 0x16]                  
  155f  26803f00         cmp byte ptr es:[bx], 0                  
  1563  7412             je 0x1577                                
  1565  ff7618           push word ptr [bp + 0x18]                
  1568  53               push bx                                  
  1569  66684801e100     push 0xe10148                            
  156f  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1574  83c408           add sp, 8                                
  1577  66837e1a00       cmp dword ptr [bp + 0x1a], 0             
  157c  741b             je 0x1599                                
  157e  c45e1a           les bx, ptr [bp + 0x1a]                  
  1581  26803f00         cmp byte ptr es:[bx], 0                  
  1585  7412             je 0x1599                                
  1587  ff761c           push word ptr [bp + 0x1c]                
  158a  53               push bx                                  
  158b  66684801f500     push 0xf50148                            
  1591  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1596  83c408           add sp, 8                                
  1599  66837e1e00       cmp dword ptr [bp + 0x1e], 0             
  159e  7503             jne 0x15a3                               
  15a0  e9e200           jmp 0x1685                               
  15a3  c45e1e           les bx, ptr [bp + 0x1e]                  
  15a6  26803f00         cmp byte ptr es:[bx], 0                  
  15aa  7503             jne 0x15af                               
  15ac  e9d600           jmp 0x1685                               
  15af  ff7620           push word ptr [bp + 0x20]                
  15b2  53               push bx                                  
  15b3  680901           push 0x109                               
  15b6  e9c100           jmp 0x167a                               
  15b9  66837e0a00       cmp dword ptr [bp + 0xa], 0              
  15be  741b             je 0x15db                                
  15c0  c45e0a           les bx, ptr [bp + 0xa]                   
  15c3  26803f00         cmp byte ptr es:[bx], 0                  
  15c7  7412             je 0x15db                                
  15c9  ff760c           push word ptr [bp + 0xc]                 
  15cc  53               push bx                                  
  15cd  66684801a100     push 0xa10148                            
  15d3  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  15d8  83c408           add sp, 8                                
  15db  66837e0e00       cmp dword ptr [bp + 0xe], 0              
  15e0  741b             je 0x15fd                                
  15e2  c45e0e           les bx, ptr [bp + 0xe]                   
  15e5  26803f00         cmp byte ptr es:[bx], 0                  
  15e9  7412             je 0x15fd                                
  15eb  ff7610           push word ptr [bp + 0x10]                
  15ee  53               push bx                                  
  15ef  66684801b500     push 0xb50148                            
  15f5  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  15fa  83c408           add sp, 8                                
  15fd  66837e1200       cmp dword ptr [bp + 0x12], 0             
  1602  741b             je 0x161f                                
  1604  c45e12           les bx, ptr [bp + 0x12]                  
  1607  26803f00         cmp byte ptr es:[bx], 0                  
  160b  7412             je 0x161f                                
  160d  ff7614           push word ptr [bp + 0x14]                
  1610  53               push bx                                  
  1611  66684801c900     push 0xc90148                            
  1617  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  161c  83c408           add sp, 8                                
  161f  66837e1600       cmp dword ptr [bp + 0x16], 0             
  1624  741b             je 0x1641                                
  1626  c45e16           les bx, ptr [bp + 0x16]                  
  1629  26803f00         cmp byte ptr es:[bx], 0                  
  162d  7412             je 0x1641                                
  162f  ff7618           push word ptr [bp + 0x18]                
  1632  53               push bx                                  
  1633  66684801dd00     push 0xdd0148                            
  1639  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  163e  83c408           add sp, 8                                
  1641  66837e1a00       cmp dword ptr [bp + 0x1a], 0             
  1646  741b             je 0x1663                                
  1648  c45e1a           les bx, ptr [bp + 0x1a]                  
  164b  26803f00         cmp byte ptr es:[bx], 0                  
  164f  7412             je 0x1663                                
  1651  ff761c           push word ptr [bp + 0x1c]                
  1654  53               push bx                                  
  1655  66684801f100     push 0xf10148                            
  165b  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1660  83c408           add sp, 8                                
  1663  66837e1e00       cmp dword ptr [bp + 0x1e], 0             
  1668  741b             je 0x1685                                
  166a  c45e1e           les bx, ptr [bp + 0x1e]                  
  166d  26803f00         cmp byte ptr es:[bx], 0                  
  1671  7412             je 0x1685                                
  1673  ff7620           push word ptr [bp + 0x20]                
  1676  53               push bx                                  
  1677  680501           push 0x105                               
  167a  684801           push 0x148                               
  167d  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1682  83c408           add sp, 8                                
  1685  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  168a  5e               pop si                                   
  168b  5d               pop bp                                   
  168c  cb               retf                                     

ovl61_168d:  ; ENTRY
  168d  55               push bp                                  
  168e  8bec             mov bp, sp                               
  1690  83ec0a           sub sp, 0xa                              
  1693  c746f60e00       mov word ptr [bp - 0xa], 0xe             
  1698  66ff7606         push dword ptr [bp + 6]                  
  169c  9a8400c130       lcall 0x30c1, 0x84                       -> ovl59:062a
  16a1  83c404           add sp, 4                                
  16a4  8946f8           mov word ptr [bp - 8], ax                
  16a7  a16a16           mov ax, word ptr [0x166a]                
  16aa  8946fe           mov word ptr [bp - 2], ax                
  16ad  8b46f6           mov ax, word ptr [bp - 0xa]              
  16b0  0346f8           add ax, word ptr [bp - 8]                
  16b3  50               push ax                                  
  16b4  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  16b9  59               pop cx                                   
  16ba  16               push ss                                  
  16bb  8d46fa           lea ax, [bp - 6]                         
  16be  50               push ax                                  
  16bf  16               push ss                                  
  16c0  8d46fc           lea ax, [bp - 4]                         
  16c3  50               push ax                                  
  16c4  9a3e00ac2f       lcall 0x2fac, 0x3e                       -> ovl17:08f6
  16c9  83c408           add sp, 8                                
  16cc  ff76fa           push word ptr [bp - 6]                   
  16cf  ff76fc           push word ptr [bp - 4]                   
  16d2  66ff7606         push dword ptr [bp + 6]                  
  16d6  9a7f00c130       lcall 0x30c1, 0x7f                       -> ovl59:06de
  16db  83c408           add sp, 8                                
  16de  666a00           push 0                                   
  16e1  0e               push cs                                  
  16e2  e816fa           call 0x10fb                              
  16e5  83c404           add sp, 4                                
  16e8  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  16ed  8b46fe           mov ax, word ptr [bp - 2]                
  16f0  a36a16           mov word ptr [0x166a], ax                
  16f3  c9               leave                                    
  16f4  cb               retf                                     

ovl61_16f5:  ; ENTRY
  16f5  55               push bp                                  
  16f6  8bec             mov bp, sp                               
  16f8  83ec02           sub sp, 2                                
  16fb  a16a16           mov ax, word ptr [0x166a]                
  16fe  8946fe           mov word ptr [bp - 2], ax                
  1701  6a04             push 4                                   
  1703  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  1708  59               pop cx                                   
  1709  666878003200     push 0x320078                            
  170f  66ff7606         push dword ptr [bp + 6]                  
  1713  9a7f00c130       lcall 0x30c1, 0x7f                       -> ovl59:06de
  1718  83c408           add sp, 8                                
  171b  666a00           push 0                                   
  171e  0e               push cs                                  
  171f  e8d9f9           call 0x10fb                              
  1722  83c404           add sp, 4                                
  1725  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  172a  8b46fe           mov ax, word ptr [bp - 2]                
  172d  a36a16           mov word ptr [0x166a], ax                
  1730  c9               leave                                    
  1731  cb               retf                                     

ovl61_1732:  ; ENTRY
  1732  55               push bp                                  
  1733  8bec             mov bp, sp                               
  1735  83ec02           sub sp, 2                                
  1738  56               push si                                  
  1739  57               push di                                  
  173a  b8042c           mov ax, 0x2c04                           
  173d  8ec0             mov es, ax                               
  173f  26833e220100     cmp word ptr es:[0x122], 0               
  1745  751b             jne 0x1762                               
  1747  33f6             xor si, si                               
  1749  eb0f             jmp 0x175a                               
  174b  8bde             mov bx, si                               
  174d  d1e3             shl bx, 1                                
  174f  b8042c           mov ax, 0x2c04                           
  1752  8ec0             mov es, ax                               
  1754  2689b76301       mov word ptr es:[bx + 0x163], si         
  1759  46               inc si                                   
  175a  83fe08           cmp si, 8                                
  175d  7cec             jl 0x174b                                
  175f  e98400           jmp 0x17e6                               
  1762  33f6             xor si, si                               
  1764  eb0f             jmp 0x1775                               
  1766  8bde             mov bx, si                               
  1768  d1e3             shl bx, 1                                
  176a  b8042c           mov ax, 0x2c04                           
  176d  8ec0             mov es, ax                               
  176f  2689b76301       mov word ptr es:[bx + 0x163], si         
  1774  46               inc si                                   
  1775  83fe08           cmp si, 8                                
  1778  7cec             jl 0x1766                                
  177a  33f6             xor si, si                               
  177c  eb63             jmp 0x17e1                               
  177e  66680800ffff     push 0xffff0008                          
  1784  6a01             push 1                                   
  1786  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  178b  83c406           add sp, 6                                
  178e  8bf8             mov di, ax                               
  1790  66680800ffff     push 0xffff0008                          
  1796  6a01             push 1                                   
  1798  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  179d  83c406           add sp, 6                                
  17a0  8bd0             mov dx, ax                               
  17a2  8bda             mov bx, dx                               
  17a4  d1e3             shl bx, 1                                
  17a6  b8042c           mov ax, 0x2c04                           
  17a9  8ec0             mov es, ax                               
  17ab  268b876301       mov ax, word ptr es:[bx + 0x163]         
  17b0  8946fe           mov word ptr [bp - 2], ax                
  17b3  8bdf             mov bx, di                               
  17b5  d1e3             shl bx, 1                                
  17b7  b8042c           mov ax, 0x2c04                           
  17ba  8ec0             mov es, ax                               
  17bc  268b876301       mov ax, word ptr es:[bx + 0x163]         
  17c1  8bda             mov bx, dx                               
  17c3  d1e3             shl bx, 1                                
  17c5  ba042c           mov dx, 0x2c04                           
  17c8  8ec2             mov es, dx                               
  17ca  2689876301       mov word ptr es:[bx + 0x163], ax         
  17cf  8bdf             mov bx, di                               
  17d1  d1e3             shl bx, 1                                
  17d3  b8042c           mov ax, 0x2c04                           
  17d6  8b56fe           mov dx, word ptr [bp - 2]                
  17d9  8ec0             mov es, ax                               
  17db  2689976301       mov word ptr es:[bx + 0x163], dx         
  17e0  46               inc si                                   
  17e1  83fe14           cmp si, 0x14                             
  17e4  7c98             jl 0x177e                                
  17e6  b8042c           mov ax, 0x2c04                           
  17e9  8ec0             mov es, ax                               
  17eb  26c70673010000   mov word ptr es:[0x173], 0               
  17f2  5f               pop di                                   
  17f3  5e               pop si                                   
  17f4  c9               leave                                    
  17f5  cb               retf                                     

ovl61_17f6:  ; ENTRY
  17f6  55               push bp                                  
  17f7  8bec             mov bp, sp                               
  17f9  56               push si                                  
  17fa  33f6             xor si, si                               
  17fc  e9a200           jmp 0x18a1                               
  17ff  b8042c           mov ax, 0x2c04                           
  1802  8ec0             mov es, ax                               
  1804  26833e180100     cmp word ptr es:[0x118], 0               
  180a  743b             je 0x1847                                
  180c  8ec0             mov es, ax                               
  180e  26ff063501       inc word ptr es:[0x135]                  
  1813  0e               push cs                                  
  1814  e81bff           call 0x1732                              
  1817  b8042c           mov ax, 0x2c04                           
  181a  8ec0             mov es, ax                               
  181c  26c70618010000   mov word ptr es:[0x118], 0               
  1823  90               nop                                      
  1824  0e               push cs                                  
  1825  e88300           call 0x18ab                              
  1828  90               nop                                      
  1829  0e               push cs                                  
  182a  e8c002           call 0x1aed                              
  182d  9a25000230       lcall 0x3002, 0x25                       -> ovl30:0034
  1832  9a2a003730       lcall 0x3037, 0x2a                       -> ovl39:025a
  1837  9a48004230       lcall 0x3042, 0x48                       -> ovl41:0d60
  183c  666a01           push 1                                   
  183f  9a34002031       lcall 0x3120, 0x34                       -> ovl68:0952
  1844  83c404           add sp, 4                                
  1847  b8042c           mov ax, 0x2c04                           
  184a  8ec0             mov es, ax                               
  184c  268b1e7301       mov bx, word ptr es:[0x173]              
  1851  d1e3             shl bx, 1                                
  1853  b8042c           mov ax, 0x2c04                           
  1856  8ec0             mov es, ax                               
  1858  268b876301       mov ax, word ptr es:[bx + 0x163]         
  185d  ba042c           mov dx, 0x2c04                           
  1860  8ec2             mov es, dx                               
  1862  26a31001         mov word ptr es:[0x110], ax              
  1866  b8042c           mov ax, 0x2c04                           
  1869  8ec0             mov es, ax                               
  186b  26ff067301       inc word ptr es:[0x173]                  
  1870  26a17301         mov ax, word ptr es:[0x173]              
  1874  3d0800           cmp ax, 8                                
  1877  7c0c             jl 0x1885                                
  1879  b8042c           mov ax, 0x2c04                           
  187c  8ec0             mov es, ax                               
  187e  26c70618010100   mov word ptr es:[0x118], 1               
  1885  b8042c           mov ax, 0x2c04                           
  1888  8ec0             mov es, ax                               
  188a  268b1e1001       mov bx, word ptr es:[0x110]              
  188f  d1e3             shl bx, 1                                
  1891  b8042c           mov ax, 0x2c04                           
  1894  8ec0             mov es, ax                               
  1896  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  189c  7403             je 0x18a1                                
  189e  be0100           mov si, 1                                
  18a1  0bf6             or si, si                                
  18a3  7503             jne 0x18a8                               
  18a5  e957ff           jmp 0x17ff                               
  18a8  5e               pop si                                   
  18a9  5d               pop bp                                   
  18aa  cb               retf                                     

ovl61_18ab:  ; ENTRY
  18ab  55               push bp                                  
  18ac  8bec             mov bp, sp                               
  18ae  83ec54           sub sp, 0x54                             
  18b1  56               push si                                  
  18b2  57               push di                                  
  18b3  9a2a00e830       lcall 0x30e8, 0x2a                       -> ovl62:03f9
  18b8  33ff             xor di, di                               
  18ba  c746fe0000       mov word ptr [bp - 2], 0                 
  18bf  eb2c             jmp 0x18ed                               
  18c1  8b5efe           mov bx, word ptr [bp - 2]                
  18c4  d1e3             shl bx, 1                                
  18c6  b8042c           mov ax, 0x2c04                           
  18c9  8ec0             mov es, ax                               
  18cb  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  18d1  7417             je 0x18ea                                
  18d3  8b5efe           mov bx, word ptr [bp - 2]                
  18d6  d1e3             shl bx, 1                                
  18d8  b8042c           mov ax, 0x2c04                           
  18db  8ec0             mov es, ax                               
  18dd  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  18e3  7505             jne 0x18ea                               
  18e5  bf0100           mov di, 1                                
  18e8  eb09             jmp 0x18f3                               
  18ea  ff46fe           inc word ptr [bp - 2]                    
  18ed  837efe08         cmp word ptr [bp - 2], 8                 
  18f1  7cce             jl 0x18c1                                
  18f3  c746fe0000       mov word ptr [bp - 2], 0                 
  18f8  e9e501           jmp 0x1ae0                               
  18fb  8b5efe           mov bx, word ptr [bp - 2]                
  18fe  d1e3             shl bx, 1                                
  1900  b8042c           mov ax, 0x2c04                           
  1903  8ec0             mov es, ax                               
  1905  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  190b  7503             jne 0x1910                               
  190d  e9cd01           jmp 0x1add                               
  1910  8b5efe           mov bx, word ptr [bp - 2]                
  1913  d1e3             shl bx, 1                                
  1915  83bfea5d00       cmp word ptr [bx + 0x5dea], 0            
  191a  7403             je 0x191f                                
  191c  e9be01           jmp 0x1add                               
  191f  b8042c           mov ax, 0x2c04                           
  1922  8ec0             mov es, ax                               
  1924  268b368101       mov si, word ptr es:[0x181]              
  1929  e9ad00           jmp 0x19d9                               
  192c  8bde             mov bx, si                               
  192e  6bdb16           imul bx, bx, 0x16                        
  1931  b81d1e           mov ax, 0x1e1d                           
  1934  8ec0             mov es, ax                               
  1936  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  193b  3a46fe           cmp al, byte ptr [bp - 2]                
  193e  7403             je 0x1943                                
  1940  e99600           jmp 0x19d9                               
  1943  8bde             mov bx, si                               
  1945  6bdb16           imul bx, bx, 0x16                        
  1948  b81d1e           mov ax, 0x1e1d                           
  194b  8ec0             mov es, ax                               
  194d  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  1953  756a             jne 0x19bf                               
  1955  b8042c           mov ax, 0x2c04                           
  1958  8ec0             mov es, ax                               
  195a  26a11001         mov ax, word ptr es:[0x110]              
  195e  8946fc           mov word ptr [bp - 4], ax                
  1961  8bde             mov bx, si                               
  1963  6bdb16           imul bx, bx, 0x16                        
  1966  b81d1e           mov ax, 0x1e1d                           
  1969  8ec0             mov es, ax                               
  196b  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  1970  98               cwde                                     
  1971  ba042c           mov dx, 0x2c04                           
  1974  8ec2             mov es, dx                               
  1976  26a31001         mov word ptr es:[0x110], ax              
  197a  8bde             mov bx, si                               
  197c  6bdb16           imul bx, bx, 0x16                        
  197f  b81d1e           mov ax, 0x1e1d                           
  1982  8ec0             mov es, ax                               
  1984  26ffb78288       push word ptr es:[bx - 0x777e]           
  1989  8bde             mov bx, si                               
  198b  6bdb16           imul bx, bx, 0x16                        
  198e  b81d1e           mov ax, 0x1e1d                           
  1991  8ec0             mov es, ax                               
  1993  26ffb78088       push word ptr es:[bx - 0x7780]           
  1998  8bc6             mov ax, si                               
  199a  6bc016           imul ax, ax, 0x16                        
  199d  ba0000           mov dx, 0                                
  19a0  03d0             add dx, ax                               
  19a2  81c28088         add dx, 0x8880                           
  19a6  681d1e           push 0x1e1d                              
  19a9  52               push dx                                  
  19aa  9a39002430       lcall 0x3024, 0x39                       -> ovl36:16cd
  19af  83c408           add sp, 8                                
  19b2  b8042c           mov ax, 0x2c04                           
  19b5  8b56fc           mov dx, word ptr [bp - 4]                
  19b8  8ec0             mov es, ax                               
  19ba  2689161001       mov word ptr es:[0x110], dx              
  19bf  8bc6             mov ax, si                               
  19c1  6bc016           imul ax, ax, 0x16                        
  19c4  ba0000           mov dx, 0                                
  19c7  03d0             add dx, ax                               
  19c9  81c28088         add dx, 0x8880                           
  19cd  681d1e           push 0x1e1d                              
  19d0  52               push dx                                  
  19d1  9abe03620b       lcall 0xb62, 0x3be                       -> 0b62:03be
  19d6  83c404           add sp, 4                                
  19d9  8bc6             mov ax, si                               
  19db  4e               dec si                                   
  19dc  0bc0             or ax, ax                                
  19de  7403             je 0x19e3                                
  19e0  e949ff           jmp 0x192c                               
  19e3  1e               push ds                                  
  19e4  68002b           push 0x2b00                              
  19e7  6a00             push 0                                   
  19e9  ff76fe           push word ptr [bp - 2]                   
  19ec  6a04             push 4                                   
  19ee  ff76fe           push word ptr [bp - 2]                   
  19f1  9a57004230       lcall 0x3042, 0x57                       -> ovl41:1244
  19f6  83c40c           add sp, 0xc                              
  19f9  8b46fe           mov ax, word ptr [bp - 2]                
  19fc  6bc014           imul ax, ax, 0x14                        
  19ff  050000           add ax, 0                                
  1a02  68042c           push 0x2c04                              
  1a05  50               push ax                                  
  1a06  66680b00ffff     push 0xffff000b                          
  1a0c  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1a11  83c404           add sp, 4                                
  1a14  52               push dx                                  
  1a15  50               push ax                                  
  1a16  16               push ss                                  
  1a17  8d46ac           lea ax, [bp - 0x54]                      
  1a1a  50               push ax                                  
  1a1b  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1a20  83c40c           add sp, 0xc                              
  1a23  8b5efe           mov bx, word ptr [bp - 2]                
  1a26  d1e3             shl bx, 1                                
  1a28  b8042c           mov ax, 0x2c04                           
  1a2b  8ec0             mov es, ax                               
  1a2d  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  1a33  7414             je 0x1a49                                
  1a35  0bff             or di, di                                
  1a37  7510             jne 0x1a49                               
  1a39  6a64             push 0x64                                
  1a3b  16               push ss                                  
  1a3c  8d46ac           lea ax, [bp - 0x54]                      
  1a3f  50               push ax                                  
  1a40  0e               push cs                                  
  1a41  e88df7           call 0x11d1                              
  1a44  83c406           add sp, 6                                
  1a47  eb0c             jmp 0x1a55                               
  1a49  16               push ss                                  
  1a4a  8d46ac           lea ax, [bp - 0x54]                      
  1a4d  50               push ax                                  
  1a4e  0e               push cs                                  
  1a4f  e8a9f6           call 0x10fb                              
  1a52  83c404           add sp, 4                                
  1a55  8b5efe           mov bx, word ptr [bp - 2]                
  1a58  d1e3             shl bx, 1                                
  1a5a  b8042c           mov ax, 0x2c04                           
  1a5d  8ec0             mov es, ax                               
  1a5f  26c78737010000   mov word ptr es:[bx + 0x137], 0          
  1a66  8b5efe           mov bx, word ptr [bp - 2]                
  1a69  6bdb14           imul bx, bx, 0x14                        
  1a6c  b8042c           mov ax, 0x2c04                           
  1a6f  8ec0             mov es, ax                               
  1a71  26c78785010000   mov word ptr es:[bx + 0x185], 0          
  1a78  33d2             xor dx, dx                               
  1a7a  eb5c             jmp 0x1ad8                               
  1a7c  8b5efe           mov bx, word ptr [bp - 2]                
  1a7f  c1e303           shl bx, 3                                
  1a82  03da             add bx, dx                               
  1a84  b8042c           mov ax, 0x2c04                           
  1a87  8ec0             mov es, ax                               
  1a89  2680a73b15f3     and byte ptr es:[bx + 0x153b], 0xf3      
  1a8f  26808f3b1504     or byte ptr es:[bx + 0x153b], 4          
  1a95  8b5efe           mov bx, word ptr [bp - 2]                
  1a98  c1e303           shl bx, 3                                
  1a9b  03da             add bx, dx                               
  1a9d  8ec0             mov es, ax                               
  1a9f  2680a73b15fc     and byte ptr es:[bx + 0x153b], 0xfc      
  1aa5  26808f3b1501     or byte ptr es:[bx + 0x153b], 1          
  1aab  8bda             mov bx, dx                               
  1aad  c1e303           shl bx, 3                                
  1ab0  035efe           add bx, word ptr [bp - 2]                
  1ab3  8ec0             mov es, ax                               
  1ab5  2680a73b15f3     and byte ptr es:[bx + 0x153b], 0xf3      
  1abb  26808f3b1504     or byte ptr es:[bx + 0x153b], 4          
  1ac1  8bda             mov bx, dx                               
  1ac3  c1e303           shl bx, 3                                
  1ac6  035efe           add bx, word ptr [bp - 2]                
  1ac9  8ec0             mov es, ax                               
  1acb  2680a73b15fc     and byte ptr es:[bx + 0x153b], 0xfc      
  1ad1  26808f3b1501     or byte ptr es:[bx + 0x153b], 1          
  1ad7  42               inc dx                                   
  1ad8  83fa08           cmp dx, 8                                
  1adb  7c9f             jl 0x1a7c                                
  1add  ff46fe           inc word ptr [bp - 2]                    
  1ae0  837efe08         cmp word ptr [bp - 2], 8                 
  1ae4  7d03             jge 0x1ae9                               
  1ae6  e912fe           jmp 0x18fb                               
  1ae9  5f               pop di                                   
  1aea  5e               pop si                                   
  1aeb  c9               leave                                    
  1aec  cb               retf                                     

ovl61_1aed:  ; ENTRY
  1aed  55               push bp                                  
  1aee  8bec             mov bp, sp                               
  1af0  83ec56           sub sp, 0x56                             
  1af3  56               push si                                  
  1af4  57               push di                                  
  1af5  c746fe0000       mov word ptr [bp - 2], 0                 
  1afa  9a2a00e830       lcall 0x30e8, 0x2a                       -> ovl62:03f9
  1aff  33ff             xor di, di                               
  1b01  eb45             jmp 0x1b48                               
  1b03  8bdf             mov bx, di                               
  1b05  6bdb41           imul bx, bx, 0x41                        
  1b08  b8042c           mov ax, 0x2c04                           
  1b0b  8ec0             mov es, ax                               
  1b0d  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  1b12  69dbe000         imul bx, bx, 0xe0                        
  1b16  8bf7             mov si, di                               
  1b18  6bf641           imul si, si, 0x41                        
  1b1b  b8042c           mov ax, 0x2c04                           
  1b1e  8ec0             mov es, ax                               
  1b20  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  1b25  d1e0             shl ax, 1                                
  1b27  03d8             add bx, ax                               
  1b29  b81d1e           mov ax, 0x1e1d                           
  1b2c  8ec0             mov es, ax                               
  1b2e  268a9f0000       mov bl, byte ptr es:[bx]                 
  1b33  81e3ff00         and bx, 0xff                             
  1b37  b8042c           mov ax, 0x2c04                           
  1b3a  8ec0             mov es, ax                               
  1b3c  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  1b42  7503             jne 0x1b47                               
  1b44  ff46fe           inc word ptr [bp - 2]                    
  1b47  47               inc di                                   
  1b48  b8042c           mov ax, 0x2c04                           
  1b4b  8ec0             mov es, ax                               
  1b4d  26393e7b15       cmp word ptr es:[0x157b], di             
  1b52  7faf             jg 0x1b03                                
  1b54  33c0             xor ax, ax                               
  1b56  8946fc           mov word ptr [bp - 4], ax                
  1b59  8bf0             mov si, ax                               
  1b5b  b90100           mov cx, 1                                
  1b5e  33ff             xor di, di                               
  1b60  ba0800           mov dx, 8                                
  1b63  e99600           jmp 0x1bfc                               
  1b66  8bda             mov bx, dx                               
  1b68  d1e3             shl bx, 1                                
  1b6a  b8042c           mov ax, 0x2c04                           
  1b6d  8ec0             mov es, ax                               
  1b6f  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  1b75  7402             je 0x1b79                                
  1b77  33c9             xor cx, cx                               
  1b79  8bda             mov bx, dx                               
  1b7b  d1e3             shl bx, 1                                
  1b7d  b8042c           mov ax, 0x2c04                           
  1b80  8ec0             mov es, ax                               
  1b82  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  1b88  7524             jne 0x1bae                               
  1b8a  8bda             mov bx, dx                               
  1b8c  d1e3             shl bx, 1                                
  1b8e  b8042c           mov ax, 0x2c04                           
  1b91  8ec0             mov es, ax                               
  1b93  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  1b99  7513             jne 0x1bae                               
  1b9b  bf0100           mov di, 1                                
  1b9e  8bda             mov bx, dx                               
  1ba0  d1e3             shl bx, 1                                
  1ba2  b8042c           mov ax, 0x2c04                           
  1ba5  8ec0             mov es, ax                               
  1ba7  26c787d0000100   mov word ptr es:[bx + 0xd0], 1           
  1bae  8bda             mov bx, dx                               
  1bb0  d1e3             shl bx, 1                                
  1bb2  b8042c           mov ax, 0x2c04                           
  1bb5  8ec0             mov es, ax                               
  1bb7  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  1bbd  7418             je 0x1bd7                                
  1bbf  8bda             mov bx, dx                               
  1bc1  d1e3             shl bx, 1                                
  1bc3  b8042c           mov ax, 0x2c04                           
  1bc6  8ec0             mov es, ax                               
  1bc8  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  1bce  7507             jne 0x1bd7                               
  1bd0  bf0100           mov di, 1                                
  1bd3  46               inc si                                   
  1bd4  8956fa           mov word ptr [bp - 6], dx                
  1bd7  8bda             mov bx, dx                               
  1bd9  d1e3             shl bx, 1                                
  1bdb  b8042c           mov ax, 0x2c04                           
  1bde  8ec0             mov es, ax                               
  1be0  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  1be6  7414             je 0x1bfc                                
  1be8  8bda             mov bx, dx                               
  1bea  d1e3             shl bx, 1                                
  1bec  b8042c           mov ax, 0x2c04                           
  1bef  8ec0             mov es, ax                               
  1bf1  2683bfd00001     cmp word ptr es:[bx + 0xd0], 1           
  1bf7  7503             jne 0x1bfc                               
  1bf9  ff46fc           inc word ptr [bp - 4]                    
  1bfc  8bc2             mov ax, dx                               
  1bfe  4a               dec dx                                   
  1bff  0bc0             or ax, ax                                
  1c01  7403             je 0x1c06                                
  1c03  e960ff           jmp 0x1b66                               
  1c06  0bc9             or cx, cx                                
  1c08  7450             je 0x1c5a                                
  1c0a  66680c000100     push 0x1000c                             
  1c10  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1c15  83c404           add sp, 4                                
  1c18  52               push dx                                  
  1c19  50               push ax                                  
  1c1a  666a0c           push 0xc                                 
  1c1d  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1c22  83c404           add sp, 4                                
  1c25  52               push dx                                  
  1c26  50               push ax                                  
  1c27  0e               push cs                                  
  1c28  e835f5           call 0x1160                              
  1c2b  83c408           add sp, 8                                
  1c2e  66680c000300     push 0x3000c                             
  1c34  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1c39  83c404           add sp, 4                                
  1c3c  52               push dx                                  
  1c3d  50               push ax                                  
  1c3e  66680c000200     push 0x2000c                             
  1c44  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1c49  83c404           add sp, 4                                
  1c4c  52               push dx                                  
  1c4d  50               push ax                                  
  1c4e  0e               push cs                                  
  1c4f  e80ef5           call 0x1160                              
  1c52  83c408           add sp, 8                                
  1c55  9ab5024c0a       lcall 0xa4c, 0x2b5                       -> 0a4c:02b5
  1c5a  b8042c           mov ax, 0x2c04                           
  1c5d  8ec0             mov es, ax                               
  1c5f  26833e5b0100     cmp word ptr es:[0x15b], 0               
  1c65  7553             jne 0x1cba                               
  1c67  0bf6             or si, si                                
  1c69  754f             jne 0x1cba                               
  1c6b  0bff             or di, di                                
  1c6d  744b             je 0x1cba                                
  1c6f  66680d000100     push 0x1000d                             
  1c75  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1c7a  83c404           add sp, 4                                
  1c7d  52               push dx                                  
  1c7e  50               push ax                                  
  1c7f  666a0d           push 0xd                                 
  1c82  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1c87  83c404           add sp, 4                                
  1c8a  52               push dx                                  
  1c8b  50               push ax                                  
  1c8c  0e               push cs                                  
  1c8d  e8d0f4           call 0x1160                              
  1c90  83c408           add sp, 8                                
  1c93  66680d000300     push 0x3000d                             
  1c99  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1c9e  83c404           add sp, 4                                
  1ca1  52               push dx                                  
  1ca2  50               push ax                                  
  1ca3  66680d000200     push 0x2000d                             
  1ca9  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1cae  83c404           add sp, 4                                
  1cb1  52               push dx                                  
  1cb2  50               push ax                                  
  1cb3  0e               push cs                                  
  1cb4  e8a9f4           call 0x1160                              
  1cb7  83c408           add sp, 8                                
  1cba  b8042c           mov ax, 0x2c04                           
  1cbd  8ec0             mov es, ax                               
  1cbf  26833e5b0100     cmp word ptr es:[0x15b], 0               
  1cc5  7540             jne 0x1d07                               
  1cc7  83fe01           cmp si, 1                                
  1cca  753b             jne 0x1d07                               
  1ccc  837efc00         cmp word ptr [bp - 4], 0                 
  1cd0  7535             jne 0x1d07                               
  1cd2  8b5efa           mov bx, word ptr [bp - 6]                
  1cd5  d1e3             shl bx, 1                                
  1cd7  8b46fe           mov ax, word ptr [bp - 2]                
  1cda  99               cdq                                      
  1cdb  2bc2             sub ax, dx                               
  1cdd  d1f8             sar ax, 1                                
  1cdf  3987ea5d         cmp word ptr [bx + 0x5dea], ax           
  1ce3  7e22             jle 0x1d07                               
  1ce5  b8042c           mov ax, 0x2c04                           
  1ce8  8ec0             mov es, ax                               
  1cea  26c7065b010100   mov word ptr es:[0x15b], 1               
  1cf1  1e               push ds                                  
  1cf2  68012b           push 0x2b01                              
  1cf5  6a00             push 0                                   
  1cf7  ff76fa           push word ptr [bp - 6]                   
  1cfa  6a07             push 7                                   
  1cfc  ff76fa           push word ptr [bp - 6]                   
  1cff  9a57004230       lcall 0x3042, 0x57                       -> ovl41:1244
  1d04  83c40c           add sp, 0xc                              
  1d07  b8042c           mov ax, 0x2c04                           
  1d0a  8ec0             mov es, ax                               
  1d0c  26833e5b0100     cmp word ptr es:[0x15b], 0               
  1d12  7403             je 0x1d17                                
  1d14  e98200           jmp 0x1d99                               
  1d17  0bf6             or si, si                                
  1d19  757e             jne 0x1d99                               
  1d1b  837efc01         cmp word ptr [bp - 4], 1                 
  1d1f  7578             jne 0x1d99                               
  1d21  8ec0             mov es, ax                               
  1d23  26c7065b010100   mov word ptr es:[0x15b], 1               
  1d2a  33ff             xor di, di                               
  1d2c  eb12             jmp 0x1d40                               
  1d2e  8bdf             mov bx, di                               
  1d30  d1e3             shl bx, 1                                
  1d32  b8042c           mov ax, 0x2c04                           
  1d35  8ec0             mov es, ax                               
  1d37  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  1d3d  7506             jne 0x1d45                               
  1d3f  47               inc di                                   
  1d40  83ff08           cmp di, 8                                
  1d43  7ce9             jl 0x1d2e                                
  1d45  8bc7             mov ax, di                               
  1d47  6bc014           imul ax, ax, 0x14                        
  1d4a  050000           add ax, 0                                
  1d4d  68042c           push 0x2c04                              
  1d50  50               push ax                                  
  1d51  666a0f           push 0xf                                 
  1d54  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1d59  83c404           add sp, 4                                
  1d5c  52               push dx                                  
  1d5d  50               push ax                                  
  1d5e  16               push ss                                  
  1d5f  8d46aa           lea ax, [bp - 0x56]                      
  1d62  50               push ax                                  
  1d63  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1d68  83c40c           add sp, 0xc                              
  1d6b  16               push ss                                  
  1d6c  8d46aa           lea ax, [bp - 0x56]                      
  1d6f  50               push ax                                  
  1d70  0e               push cs                                  
  1d71  e887f3           call 0x10fb                              
  1d74  83c404           add sp, 4                                
  1d77  8bdf             mov bx, di                               
  1d79  d1e3             shl bx, 1                                
  1d7b  b8042c           mov ax, 0x2c04                           
  1d7e  8ec0             mov es, ax                               
  1d80  26c787d0000000   mov word ptr es:[bx + 0xd0], 0           
  1d87  1e               push ds                                  
  1d88  68022b           push 0x2b02                              
  1d8b  6a00             push 0                                   
  1d8d  57               push di                                  
  1d8e  6a07             push 7                                   
  1d90  57               push di                                  
  1d91  9a57004230       lcall 0x3042, 0x57                       -> ovl41:1244
  1d96  83c40c           add sp, 0xc                              
  1d99  b8042c           mov ax, 0x2c04                           
  1d9c  8ec0             mov es, ax                               
  1d9e  26833e5b0100     cmp word ptr es:[0x15b], 0               
  1da4  7403             je 0x1da9                                
  1da6  e9a100           jmp 0x1e4a                               
  1da9  83fe01           cmp si, 1                                
  1dac  7403             je 0x1db1                                
  1dae  e99900           jmp 0x1e4a                               
  1db1  837efc01         cmp word ptr [bp - 4], 1                 
  1db5  7d03             jge 0x1dba                               
  1db7  e99000           jmp 0x1e4a                               
  1dba  8ec0             mov es, ax                               
  1dbc  26833e5d0100     cmp word ptr es:[0x15d], 0               
  1dc2  7403             je 0x1dc7                                
  1dc4  e98300           jmp 0x1e4a                               
  1dc7  33c9             xor cx, cx                               
  1dc9  33ff             xor di, di                               
  1dcb  eb35             jmp 0x1e02                               
  1dcd  8bdf             mov bx, di                               
  1dcf  d1e3             shl bx, 1                                
  1dd1  b8042c           mov ax, 0x2c04                           
  1dd4  8ec0             mov es, ax                               
  1dd6  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  1ddc  7423             je 0x1e01                                
  1dde  8bdf             mov bx, di                               
  1de0  d1e3             shl bx, 1                                
  1de2  b8042c           mov ax, 0x2c04                           
  1de5  8ec0             mov es, ax                               
  1de7  2683bfd00001     cmp word ptr es:[bx + 0xd0], 1           
  1ded  7512             jne 0x1e01                               
  1def  8bdf             mov bx, di                               
  1df1  d1e3             shl bx, 1                                
  1df3  398fea5d         cmp word ptr [bx + 0x5dea], cx           
  1df7  7e08             jle 0x1e01                               
  1df9  8bdf             mov bx, di                               
  1dfb  d1e3             shl bx, 1                                
  1dfd  8b8fea5d         mov cx, word ptr [bx + 0x5dea]           
  1e01  47               inc di                                   
  1e02  83ff08           cmp di, 8                                
  1e05  7cc6             jl 0x1dcd                                
  1e07  8b5efa           mov bx, word ptr [bp - 6]                
  1e0a  d1e3             shl bx, 1                                
  1e0c  b8042c           mov ax, 0x2c04                           
  1e0f  8ec0             mov es, ax                               
  1e11  26a17b15         mov ax, word ptr es:[0x157b]             
  1e15  99               cdq                                      
  1e16  2bc2             sub ax, dx                               
  1e18  d1f8             sar ax, 1                                
  1e1a  3987ea5d         cmp word ptr [bx + 0x5dea], ax           
  1e1e  7e2a             jle 0x1e4a                               
  1e20  b8042c           mov ax, 0x2c04                           
  1e23  8ec0             mov es, ax                               
  1e25  26a17b15         mov ax, word ptr es:[0x157b]             
  1e29  bb0800           mov bx, 8                                
  1e2c  99               cdq                                      
  1e2d  f7fb             idiv bx                                  
  1e2f  8bd1             mov dx, cx                               
  1e31  03d0             add dx, ax                               
  1e33  8b5efa           mov bx, word ptr [bp - 6]                
  1e36  d1e3             shl bx, 1                                
  1e38  3b97ea5d         cmp dx, word ptr [bx + 0x5dea]           
  1e3c  7d0c             jge 0x1e4a                               
  1e3e  b8042c           mov ax, 0x2c04                           
  1e41  8ec0             mov es, ax                               
  1e43  26c7065d010100   mov word ptr es:[0x15d], 1               
  1e4a  5f               pop di                                   
  1e4b  5e               pop si                                   
  1e4c  c9               leave                                    
  1e4d  cb               retf                                     

ovl61_1e4e:  ; ENTRY
  1e4e  55               push bp                                  
  1e4f  8bec             mov bp, sp                               
  1e51  33d2             xor dx, dx                               
  1e53  eb33             jmp 0x1e88                               
  1e55  8bda             mov bx, dx                               
  1e57  d1e3             shl bx, 1                                
  1e59  b8042c           mov ax, 0x2c04                           
  1e5c  8ec0             mov es, ax                               
  1e5e  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  1e64  7421             je 0x1e87                                
  1e66  8bda             mov bx, dx                               
  1e68  d1e3             shl bx, 1                                
  1e6a  b8042c           mov ax, 0x2c04                           
  1e6d  8ec0             mov es, ax                               
  1e6f  2683bfd00001     cmp word ptr es:[bx + 0xd0], 1           
  1e75  7510             jne 0x1e87                               
  1e77  8bda             mov bx, dx                               
  1e79  d1e3             shl bx, 1                                
  1e7b  b8042c           mov ax, 0x2c04                           
  1e7e  8ec0             mov es, ax                               
  1e80  26c78737010000   mov word ptr es:[bx + 0x137], 0          
  1e87  42               inc dx                                   
  1e88  83fa08           cmp dx, 8                                
  1e8b  7cc8             jl 0x1e55                                
  1e8d  b8042c           mov ax, 0x2c04                           
  1e90  8ec0             mov es, ax                               
  1e92  26c7065b010100   mov word ptr es:[0x15b], 1               
  1e99  1e               push ds                                  
  1e9a  68032b           push 0x2b03                              
  1e9d  6a00             push 0                                   
  1e9f  8ec0             mov es, ax                               
  1ea1  26ff361001       push word ptr es:[0x110]                 
  1ea6  6a07             push 7                                   
  1ea8  8ec0             mov es, ax                               
  1eaa  26ff361001       push word ptr es:[0x110]                 
  1eaf  9a57004230       lcall 0x3042, 0x57                       -> ovl41:1244
  1eb4  83c40c           add sp, 0xc                              
  1eb7  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  1ebc  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  1ec1  90               nop                                      
  1ec2  0e               push cs                                  
  1ec3  e8f700           call 0x1fbd                              
  1ec6  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  1ecb  5d               pop bp                                   
  1ecc  cb               retf                                     

ovl61_1ecd:  ; ENTRY
  1ecd  55               push bp                                  
  1ece  8bec             mov bp, sp                               
  1ed0  56               push si                                  
  1ed1  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  1ed6  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  1edb  6a0a             push 0xa                                 
  1edd  9a2000ba30       lcall 0x30ba, 0x20                       -> ovl58:0000
  1ee2  59               pop cx                                   
  1ee3  6a15             push 0x15                                
  1ee5  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  1eea  59               pop cx                                   
  1eeb  6a1f             push 0x1f                                
  1eed  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  1ef2  59               pop cx                                   
  1ef3  6668e4010100     push 0x101e4                             
  1ef9  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1efe  83c404           add sp, 4                                
  1f01  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  1f06  33c9             xor cx, cx                               
  1f08  eb56             jmp 0x1f60                               
  1f0a  8bd9             mov bx, cx                               
  1f0c  d1e3             shl bx, 1                                
  1f0e  b8042c           mov ax, 0x2c04                           
  1f11  8ec0             mov es, ax                               
  1f13  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  1f19  7444             je 0x1f5f                                
  1f1b  33f6             xor si, si                               
  1f1d  eb3b             jmp 0x1f5a                               
  1f1f  8bde             mov bx, si                               
  1f21  d1e3             shl bx, 1                                
  1f23  b8042c           mov ax, 0x2c04                           
  1f26  8ec0             mov es, ax                               
  1f28  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  1f2e  7429             je 0x1f59                                
  1f30  8bde             mov bx, si                               
  1f32  d1e3             shl bx, 1                                
  1f34  b8042c           mov ax, 0x2c04                           
  1f37  8ec0             mov es, ax                               
  1f39  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  1f3f  7518             jne 0x1f59                               
  1f41  8bd9             mov bx, cx                               
  1f43  d1e3             shl bx, 1                                
  1f45  b8042c           mov ax, 0x2c04                           
  1f48  ba042c           mov dx, 0x2c04                           
  1f4b  8ec2             mov es, dx                               
  1f4d  268b161001       mov dx, word ptr es:[0x110]              
  1f52  8ec0             mov es, ax                               
  1f54  268997f310       mov word ptr es:[bx + 0x10f3], dx        
  1f59  46               inc si                                   
  1f5a  83fe08           cmp si, 8                                
  1f5d  7cc0             jl 0x1f1f                                
  1f5f  41               inc cx                                   
  1f60  83f908           cmp cx, 8                                
  1f63  7ca5             jl 0x1f0a                                
  1f65  5e               pop si                                   
  1f66  5d               pop bp                                   
  1f67  cb               retf                                     

ovl61_1f68:  ; ENTRY
  1f68  55               push bp                                  
  1f69  8bec             mov bp, sp                               
  1f6b  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  1f70  c7066a160100     mov word ptr [0x166a], 1                 
  1f76  6a09             push 9                                   
  1f78  9a2000ba30       lcall 0x30ba, 0x20                       -> ovl58:0000
  1f7d  59               pop cx                                   
  1f7e  6a14             push 0x14                                
  1f80  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  1f85  59               pop cx                                   
  1f86  6a1e             push 0x1e                                
  1f88  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  1f8d  59               pop cx                                   
  1f8e  6668e5010100     push 0x101e5                             
  1f94  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1f99  83c404           add sp, 4                                
  1f9c  6668e6010100     push 0x101e6                             
  1fa2  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1fa7  83c404           add sp, 4                                
  1faa  b8042c           mov ax, 0x2c04                           
  1fad  8ec0             mov es, ax                               
  1faf  26c7065f010100   mov word ptr es:[0x15f], 1               
  1fb6  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  1fbb  5d               pop bp                                   
  1fbc  cb               retf                                     

ovl61_1fbd:  ; ENTRY
  1fbd  55               push bp                                  
  1fbe  8bec             mov bp, sp                               
  1fc0  6a03             push 3                                   
  1fc2  9a2000ba30       lcall 0x30ba, 0x20                       -> ovl58:0000
  1fc7  59               pop cx                                   
  1fc8  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  1fcd  c7066a160100     mov word ptr [0x166a], 1                 
  1fd3  6a16             push 0x16                                
  1fd5  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  1fda  59               pop cx                                   
  1fdb  6a20             push 0x20                                
  1fdd  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  1fe2  59               pop cx                                   
  1fe3  6668e3010100     push 0x101e3                             
  1fe9  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1fee  83c404           add sp, 4                                
  1ff1  b8042c           mov ax, 0x2c04                           
  1ff4  8ec0             mov es, ax                               
  1ff6  26c70657010100   mov word ptr es:[0x157], 1               
  1ffd  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  2002  5d               pop bp                                   
  2003  cb               retf                                     

ovl61_2004:  ; ENTRY
  2004  55               push bp                                  
  2005  8bec             mov bp, sp                               
  2007  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  200c  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  2011  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  2016  c7066a160000     mov word ptr [0x166a], 0                 
  201c  9a9d00f930       lcall 0x30f9, 0x9d                       -> ovl64:15da
  2021  b8042c           mov ax, 0x2c04                           
  2024  8ec0             mov es, ax                               
  2026  26c70624010000   mov word ptr es:[0x124], 0               
  202d  666801000100     push 0x10001                             
  2033  6a01             push 1                                   
  2035  0e               push cs                                  
  2036  e8e6e0           call 0x11f                               
  2039  83c406           add sp, 6                                
  203c  6a00             push 0                                   
  203e  9a2a002031       lcall 0x3120, 0x2a                       -> ovl68:04bd
  2043  59               pop cx                                   
  2044  5d               pop bp                                   
  2045  cb               retf                                     

ovl61_2046:  ; ENTRY
  2046  55               push bp                                  
  2047  8bec             mov bp, sp                               
  2049  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  204e  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  2053  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  2058  c7066a160000     mov word ptr [0x166a], 0                 
  205e  666a00           push 0                                   
  2061  6a00             push 0                                   
  2063  0e               push cs                                  
  2064  e8b8e0           call 0x11f                               
  2067  83c406           add sp, 6                                
  206a  6a00             push 0                                   
  206c  9a2a002031       lcall 0x3120, 0x2a                       -> ovl68:04bd
  2071  59               pop cx                                   
  2072  5d               pop bp                                   
  2073  cb               retf                                     

ovl61_2074:  ; ENTRY
  2074  55               push bp                                  
  2075  8bec             mov bp, sp                               
  2077  b8042c           mov ax, 0x2c04                           
  207a  8ec0             mov es, ax                               
  207c  26833e5b0100     cmp word ptr es:[0x15b], 0               
  2082  7403             je 0x2087                                
  2084  e99a00           jmp 0x2121                               
  2087  9a5700542f       lcall 0x2f54, 0x57                       -> ovl00:1063
  208c  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  2091  0e               push cs                                  
  2092  e883e3           call 0x418                               
  2095  9a8400f930       lcall 0x30f9, 0x84                       -> ovl64:0e68
  209a  6633c0           xor eax, eax                             
  209d  66a35e5e         mov dword ptr [0x5e5e], eax              
  20a1  66a3625e         mov dword ptr [0x5e62], eax              
  20a5  33d2             xor dx, dx                               
  20a7  eb12             jmp 0x20bb                               
  20a9  8bda             mov bx, dx                               
  20ab  c1e302           shl bx, 2                                
  20ae  c787405e0000     mov word ptr [bx + 0x5e40], 0            
  20b4  c7873e5e0000     mov word ptr [bx + 0x5e3e], 0            
  20ba  42               inc dx                                   
  20bb  83fa08           cmp dx, 8                                
  20be  7ce9             jl 0x20a9                                
  20c0  9a8400e830       lcall 0x30e8, 0x84                       -> ovl62:0af3
  20c5  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  20ca  0e               push cs                                  
  20cb  e81dea           call 0xaeb                               
  20ce  33c9             xor cx, cx                               
  20d0  33d2             xor dx, dx                               
  20d2  eb24             jmp 0x20f8                               
  20d4  8bda             mov bx, dx                               
  20d6  d1e3             shl bx, 1                                
  20d8  b8042c           mov ax, 0x2c04                           
  20db  8ec0             mov es, ax                               
  20dd  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  20e3  7412             je 0x20f7                                
  20e5  8bda             mov bx, dx                               
  20e7  d1e3             shl bx, 1                                
  20e9  b8042c           mov ax, 0x2c04                           
  20ec  8ec0             mov es, ax                               
  20ee  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  20f4  7501             jne 0x20f7                               
  20f6  41               inc cx                                   
  20f7  42               inc dx                                   
  20f8  83fa08           cmp dx, 8                                
  20fb  7cd7             jl 0x20d4                                
  20fd  83f901           cmp cx, 1                                
  2100  7e11             jle 0x2113                               
  2102  b8042c           mov ax, 0x2c04                           
  2105  8ec0             mov es, ax                               
  2107  26833e240100     cmp word ptr es:[0x124], 0               
  210d  7404             je 0x2113                                
  210f  0e               push cs                                  
  2110  e85be9           call 0xa6e                               
  2113  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  2118  0e               push cs                                  
  2119  e8daf6           call 0x17f6                              
  211c  90               nop                                      
  211d  0e               push cs                                  
  211e  e80200           call 0x2123                              
  2121  5d               pop bp                                   
  2122  cb               retf                                     

ovl61_2123:  ; ENTRY
  2123  55               push bp                                  
  2124  8bec             mov bp, sp                               
  2126  56               push si                                  
  2127  57               push di                                  
  2128  33f6             xor si, si                               
  212a  e90901           jmp 0x2236                               
  212d  9a8900c130       lcall 0x30c1, 0x89                       -> ovl59:0a1b
  2132  bf0100           mov di, 1                                
  2135  33d2             xor dx, dx                               
  2137  eb27             jmp 0x2160                               
  2139  8bda             mov bx, dx                               
  213b  d1e3             shl bx, 1                                
  213d  b8042c           mov ax, 0x2c04                           
  2140  8ec0             mov es, ax                               
  2142  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  2148  7415             je 0x215f                                
  214a  8bda             mov bx, dx                               
  214c  d1e3             shl bx, 1                                
  214e  b8042c           mov ax, 0x2c04                           
  2151  8ec0             mov es, ax                               
  2153  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  2159  7504             jne 0x215f                               
  215b  33ff             xor di, di                               
  215d  eb06             jmp 0x2165                               
  215f  42               inc dx                                   
  2160  83fa08           cmp dx, 8                                
  2163  7cd4             jl 0x2139                                
  2165  9a6100c130       lcall 0x30c1, 0x61                       -> ovl59:01f1
  216a  0bff             or di, di                                
  216c  7405             je 0x2173                                
  216e  9a8a001d15       lcall 0x151d, 0x8a                       -> 151d:008a
  2173  b8042c           mov ax, 0x2c04                           
  2176  8ec0             mov es, ax                               
  2178  26ff361001       push word ptr es:[0x110]                 
  217d  9a39001d30       lcall 0x301d, 0x39                       -> ovl35:09f2
  2182  59               pop cx                                   
  2183  9a2500e830       lcall 0x30e8, 0x25                       -> ovl62:0000
  2188  6a01             push 1                                   
  218a  b8042c           mov ax, 0x2c04                           
  218d  8ec0             mov es, ax                               
  218f  26ff361001       push word ptr es:[0x110]                 
  2194  9a9e0d5505       lcall 0x555, 0xd9e                       -> 0555:0d9e
  2199  83c404           add sp, 4                                
  219c  9a4800542f       lcall 0x2f54, 0x48                       -> ovl00:0cc7
  21a1  9a39002031       lcall 0x3120, 0x39                       -> ovl68:089d
  21a6  b8042c           mov ax, 0x2c04                           
  21a9  8ec0             mov es, ax                               
  21ab  26ff361001       push word ptr es:[0x110]                 
  21b0  9a3e002430       lcall 0x3024, 0x3e                       -> ovl36:10d7
  21b5  59               pop cx                                   
  21b6  9a6b00f930       lcall 0x30f9, 0x6b                       -> ovl64:175c
  21bb  b8042c           mov ax, 0x2c04                           
  21be  8ec0             mov es, ax                               
  21c0  268b1e1001       mov bx, word ptr es:[0x110]              
  21c5  d1e3             shl bx, 1                                
  21c7  b8042c           mov ax, 0x2c04                           
  21ca  8ec0             mov es, ax                               
  21cc  2683bfd00001     cmp word ptr es:[bx + 0xd0], 1           
  21d2  7543             jne 0x2217                               
  21d4  6a02             push 2                                   
  21d6  9a2000ba30       lcall 0x30ba, 0x20                       -> ovl58:0000
  21db  59               pop cx                                   
  21dc  b8042c           mov ax, 0x2c04                           
  21df  8ec0             mov es, ax                               
  21e1  26a11001         mov ax, word ptr es:[0x110]              
  21e5  a3de2a           mov word ptr [0x2ade], ax                
  21e8  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  21ed  b8042c           mov ax, 0x2c04                           
  21f0  8ec0             mov es, ax                               
  21f2  26ff361001       push word ptr es:[0x110]                 
  21f7  9a20002031       lcall 0x3120, 0x20                       -> ovl68:0000
  21fc  59               pop cx                                   
  21fd  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  2202  0e               push cs                                  
  2203  e8f0f5           call 0x17f6                              
  2206  9aab025e15       lcall 0x155e, 0x2ab                      -> 155e:02ab
  220b  833e6a1600       cmp word ptr [0x166a], 0                 
  2210  7424             je 0x2236                                
  2212  be0100           mov si, 1                                
  2215  eb1f             jmp 0x2236                               
  2217  b8042c           mov ax, 0x2c04                           
  221a  8ec0             mov es, ax                               
  221c  26ff361001       push word ptr es:[0x110]                 
  2221  9a25002031       lcall 0x3120, 0x25                       -> ovl68:0259
  2226  59               pop cx                                   
  2227  be0100           mov si, 1                                
  222a  b8042c           mov ax, 0x2c04                           
  222d  8ec0             mov es, ax                               
  222f  26a11001         mov ax, word ptr es:[0x110]              
  2233  a3de2a           mov word ptr [0x2ade], ax                
  2236  0bf6             or si, si                                
  2238  751d             jne 0x2257                               
  223a  b8042c           mov ax, 0x2c04                           
  223d  8ec0             mov es, ax                               
  223f  26833e5b0100     cmp word ptr es:[0x15b], 0               
  2245  7503             jne 0x224a                               
  2247  e9e3fe           jmp 0x212d                               
  224a  8ec0             mov es, ax                               
  224c  26833e570100     cmp word ptr es:[0x157], 0               
  2252  7503             jne 0x2257                               
  2254  e9d6fe           jmp 0x212d                               
  2257  5f               pop di                                   
  2258  5e               pop si                                   
  2259  5d               pop bp                                   
  225a  cb               retf                                     

ovl61_225b:  ; ENTRY
  225b  55               push bp                                  
  225c  8bec             mov bp, sp                               
  225e  b8042c           mov ax, 0x2c04                           
  2261  8ec0             mov es, ax                               
  2263  26833e350101     cmp word ptr es:[0x135], 1               
  2269  7e08             jle 0x2273                               
  226b  8ec0             mov es, ax                               
  226d  26a13501         mov ax, word ptr es:[0x135]              
  2271  eb03             jmp 0x2276                               
  2273  b80100           mov ax, 1                                
  2276  5d               pop bp                                   
  2277  cb               retf                                     
