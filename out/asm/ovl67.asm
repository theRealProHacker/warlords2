; ovl67 stub 3119 file_off 0x82c80 size 0xbdc

ovl67_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  56               push si                                  
  0004  57               push di                                  
  0005  b8042c           mov ax, 0x2c04                           
  0008  8ec0             mov es, ax                               
  000a  268b0e8101       mov cx, word ptr es:[0x181]              
  000f  e9f300           jmp 0x105                                
  0012  8bd9             mov bx, cx                               
  0014  6bdb16           imul bx, bx, 0x16                        
  0017  b81d1e           mov ax, 0x1e1d                           
  001a  8ec0             mov es, ax                               
  001c  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0021  ba042c           mov dx, 0x2c04                           
  0024  8ec2             mov es, dx                               
  0026  263a061001       cmp al, byte ptr es:[0x110]              
  002b  7403             je 0x30                                  
  002d  e9d500           jmp 0x105                                
  0030  8bd9             mov bx, cx                               
  0032  6bdb16           imul bx, bx, 0x16                        
  0035  b81d1e           mov ax, 0x1e1d                           
  0038  8ec0             mov es, ax                               
  003a  268b878c88       mov ax, word ptr es:[bx - 0x7774]        
  003f  f7d0             not ax                                   
  0041  a90100           test ax, 1                               
  0044  7503             jne 0x49                                 
  0046  e9bc00           jmp 0x105                                
  0049  8bd9             mov bx, cx                               
  004b  6bdb16           imul bx, bx, 0x16                        
  004e  b81d1e           mov ax, 0x1e1d                           
  0051  8ec0             mov es, ax                               
  0053  268a878788       mov al, byte ptr es:[bx - 0x7779]        
  0058  8bd9             mov bx, cx                               
  005a  6bdb16           imul bx, bx, 0x16                        
  005d  ba1d1e           mov dx, 0x1e1d                           
  0060  8ec2             mov es, dx                               
  0062  263a878688       cmp al, byte ptr es:[bx - 0x777a]        
  0067  7d03             jge 0x6c                                 
  0069  e99900           jmp 0x105                                
  006c  8bd9             mov bx, cx                               
  006e  6bdb16           imul bx, bx, 0x16                        
  0071  b81d1e           mov ax, 0x1e1d                           
  0074  ba0000           mov dx, 0                                
  0077  81c28088         add dx, 0x8880                           
  007b  03da             add bx, dx                               
  007d  8ec0             mov es, ax                               
  007f  268b37           mov si, word ptr es:[bx]                 
  0082  8bd9             mov bx, cx                               
  0084  6bdb16           imul bx, bx, 0x16                        
  0087  b81d1e           mov ax, 0x1e1d                           
  008a  8ec0             mov es, ax                               
  008c  268bbf8288       mov di, word ptr es:[bx - 0x777e]        
  0091  8bdf             mov bx, di                               
  0093  69dbe000         imul bx, bx, 0xe0                        
  0097  8bc6             mov ax, si                               
  0099  d1e0             shl ax, 1                                
  009b  03d8             add bx, ax                               
  009d  b81d1e           mov ax, 0x1e1d                           
  00a0  8ec0             mov es, ax                               
  00a2  268a9f0000       mov bl, byte ptr es:[bx]                 
  00a7  81e3ff00         and bx, 0xff                             
  00ab  b8042c           mov ax, 0x2c04                           
  00ae  8ec0             mov es, ax                               
  00b0  268a871007       mov al, byte ptr es:[bx + 0x710]         
  00b5  98               cwde                                     
  00b6  8bd0             mov dx, ax                               
  00b8  83fa07           cmp dx, 7                                
  00bb  7431             je 0xee                                  
  00bd  83fa04           cmp dx, 4                                
  00c0  742c             je 0xee                                  
  00c2  83fa05           cmp dx, 5                                
  00c5  7427             je 0xee                                  
  00c7  83fa01           cmp dx, 1                                
  00ca  7422             je 0xee                                  
  00cc  83fa08           cmp dx, 8                                
  00cf  741d             je 0xee                                  
  00d1  83fa09           cmp dx, 9                                
  00d4  7418             je 0xee                                  
  00d6  8bdf             mov bx, di                               
  00d8  6bdb70           imul bx, bx, 0x70                        
  00db  03de             add bx, si                               
  00dd  b8d919           mov ax, 0x19d9                           
  00e0  8ec0             mov es, ax                               
  00e2  268a870000       mov al, byte ptr es:[bx]                 
  00e7  251f00           and ax, 0x1f                             
  00ea  0bc0             or ax, ax                                
  00ec  7417             je 0x105                                 
  00ee  8bdf             mov bx, di                               
  00f0  69dbe000         imul bx, bx, 0xe0                        
  00f4  8bc6             mov ax, si                               
  00f6  d1e0             shl ax, 1                                
  00f8  03d8             add bx, ax                               
  00fa  b81d1e           mov ax, 0x1e1d                           
  00fd  8ec0             mov es, ax                               
  00ff  26808f010020     or byte ptr es:[bx + 1], 0x20            
  0105  8bc1             mov ax, cx                               
  0107  49               dec cx                                   
  0108  0bc0             or ax, ax                                
  010a  7403             je 0x10f                                 
  010c  e903ff           jmp 0x12                                 
  010f  5f               pop di                                   
  0110  5e               pop si                                   
  0111  5d               pop bp                                   
  0112  cb               retf                                     

ovl67_0113:  ; ENTRY
  0113  55               push bp                                  
  0114  8bec             mov bp, sp                               
  0116  b8042c           mov ax, 0x2c04                           
  0119  8ec0             mov es, ax                               
  011b  268b0e8101       mov cx, word ptr es:[0x181]              
  0120  eb39             jmp 0x15b                                
  0122  8bd9             mov bx, cx                               
  0124  6bdb16           imul bx, bx, 0x16                        
  0127  b81d1e           mov ax, 0x1e1d                           
  012a  8ec0             mov es, ax                               
  012c  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0131  ba042c           mov dx, 0x2c04                           
  0134  8ec2             mov es, dx                               
  0136  263a061001       cmp al, byte ptr es:[0x110]              
  013b  751e             jne 0x15b                                
  013d  8bd9             mov bx, cx                               
  013f  6bdb16           imul bx, bx, 0x16                        
  0142  b81d1e           mov ax, 0x1e1d                           
  0145  8ec0             mov es, ax                               
  0147  2683a78c88bf     and word ptr es:[bx - 0x7774], 0xffbf    
  014d  8bd9             mov bx, cx                               
  014f  6bdb16           imul bx, bx, 0x16                        
  0152  8ec0             mov es, ax                               
  0154  2681a78c88fffd   and word ptr es:[bx - 0x7774], 0xfdff    
  015b  8bc1             mov ax, cx                               
  015d  49               dec cx                                   
  015e  0bc0             or ax, ax                                
  0160  75c0             jne 0x122                                
  0162  b8042c           mov ax, 0x2c04                           
  0165  8ec0             mov es, ax                               
  0167  268b1e1001       mov bx, word ptr es:[0x110]              
  016c  6bdb14           imul bx, bx, 0x14                        
  016f  b8042c           mov ax, 0x2c04                           
  0172  8ec0             mov es, ax                               
  0174  268b878901       mov ax, word ptr es:[bx + 0x189]         
  0179  a35032           mov word ptr [0x3250], ax                
  017c  b8042c           mov ax, 0x2c04                           
  017f  8ec0             mov es, ax                               
  0181  268b1e1001       mov bx, word ptr es:[0x110]              
  0186  6bdb14           imul bx, bx, 0x14                        
  0189  b8042c           mov ax, 0x2c04                           
  018c  8ec0             mov es, ax                               
  018e  268b878b01       mov ax, word ptr es:[bx + 0x18b]         
  0193  a35232           mov word ptr [0x3252], ax                
  0196  b80100           mov ax, 1                                
  0199  5d               pop bp                                   
  019a  cb               retf                                     

ovl67_019b:  ; ENTRY
  019b  55               push bp                                  
  019c  8bec             mov bp, sp                               
  019e  83ec0a           sub sp, 0xa                              
  01a1  56               push si                                  
  01a2  57               push di                                  
  01a3  9a8400e830       lcall 0x30e8, 0x84                       -> ovl62:0af3
  01a8  9a3d007b07       lcall 0x77b, 0x3d                        -> 077b:003d
  01ad  90               nop                                      
  01ae  0e               push cs                                  
  01af  e85c02           call 0x40e                               
  01b2  8956fe           mov word ptr [bp - 2], dx                
  01b5  8946fc           mov word ptr [bp - 4], ax                
  01b8  66837efc00       cmp dword ptr [bp - 4], 0                
  01bd  7510             jne 0x1cf                                
  01bf  66c706625e000000 mov dword ptr [0x5e62], 0                
  01c8  9a2500ba30       lcall 0x30ba, 0x25                       -> ovl58:0b5f
  01cd  eb11             jmp 0x1e0                                
  01cf  66ff76fc         push dword ptr [bp - 4]                  
  01d3  90               nop                                      
  01d4  0e               push cs                                  
  01d5  e81305           call 0x6eb                               
  01d8  83c404           add sp, 4                                
  01db  9a3900ba30       lcall 0x30ba, 0x39                       -> ovl58:0b79
  01e0  9a34000c31       lcall 0x310c, 0x34                       -> ovl66:0356
  01e5  9a6100d730       lcall 0x30d7, 0x61                       -> ovl61:0174
  01ea  b8042c           mov ax, 0x2c04                           
  01ed  8ec0             mov es, ax                               
  01ef  26833e2e0100     cmp word ptr es:[0x12e], 0               
  01f5  7503             jne 0x1fa                                
  01f7  e94001           jmp 0x33a                                
  01fa  8ec0             mov es, ax                               
  01fc  26a03401         mov al, byte ptr es:[0x134]              
  0200  c1e803           shr ax, 3                                
  0203  250100           and ax, 1                                
  0206  0bc0             or ax, ax                                
  0208  7523             jne 0x22d                                
  020a  b8042c           mov ax, 0x2c04                           
  020d  8ec0             mov es, ax                               
  020f  26800e340108     or byte ptr es:[0x134], 8                
  0215  666819000300     push 0x30019                             
  021b  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0220  83c404           add sp, 4                                
  0223  52               push dx                                  
  0224  50               push ax                                  
  0225  9ac000d730       lcall 0x30d7, 0xc0                       -> ovl61:168d
  022a  83c404           add sp, 4                                
  022d  b8042c           mov ax, 0x2c04                           
  0230  8ec0             mov es, ax                               
  0232  26a03401         mov al, byte ptr es:[0x134]              
  0236  c1e804           shr ax, 4                                
  0239  250100           and ax, 1                                
  023c  0bc0             or ax, ax                                
  023e  7403             je 0x243                                 
  0240  e98400           jmp 0x2c7                                
  0243  33ff             xor di, di                               
  0245  eb7b             jmp 0x2c2                                
  0247  8bdf             mov bx, di                               
  0249  d1e3             shl bx, 1                                
  024b  c436625e         les si, ptr [0x5e62]                     
  024f  268b04           mov ax, word ptr es:[si]                 
  0252  03874c2b         add ax, word ptr [bx + 0x2b4c]           
  0256  8946fa           mov word ptr [bp - 6], ax                
  0259  8b1e625e         mov bx, word ptr [0x5e62]                
  025d  268b4702         mov ax, word ptr es:[bx + 2]             
  0261  8bdf             mov bx, di                               
  0263  d1e3             shl bx, 1                                
  0265  03875c2b         add ax, word ptr [bx + 0x2b5c]           
  0269  8946f8           mov word ptr [bp - 8], ax                
  026c  50               push ax                                  
  026d  ff76fa           push word ptr [bp - 6]                   
  0270  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  0275  83c404           add sp, 4                                
  0278  8946f6           mov word ptr [bp - 0xa], ax              
  027b  0bc0             or ax, ax                                
  027d  7c42             jl 0x2c1                                 
  027f  8b5ef6           mov bx, word ptr [bp - 0xa]              
  0282  6bdb41           imul bx, bx, 0x41                        
  0285  b8042c           mov ax, 0x2c04                           
  0288  8ec0             mov es, ax                               
  028a  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  028f  98               cwde                                     
  0290  ba042c           mov dx, 0x2c04                           
  0293  8ec2             mov es, dx                               
  0295  263b061001       cmp ax, word ptr es:[0x110]              
  029a  7425             je 0x2c1                                 
  029c  b8042c           mov ax, 0x2c04                           
  029f  8ec0             mov es, ax                               
  02a1  26800e340110     or byte ptr es:[0x134], 0x10             
  02a7  666819000400     push 0x40019                             
  02ad  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  02b2  83c404           add sp, 4                                
  02b5  52               push dx                                  
  02b6  50               push ax                                  
  02b7  9ac000d730       lcall 0x30d7, 0xc0                       -> ovl61:168d
  02bc  83c404           add sp, 4                                
  02bf  eb06             jmp 0x2c7                                
  02c1  47               inc di                                   
  02c2  83ff08           cmp di, 8                                
  02c5  7c80             jl 0x247                                 
  02c7  b8042c           mov ax, 0x2c04                           
  02ca  8ec0             mov es, ax                               
  02cc  26a03401         mov al, byte ptr es:[0x134]              
  02d0  c1e807           shr ax, 7                                
  02d3  250100           and ax, 1                                
  02d6  0bc0             or ax, ax                                
  02d8  7560             jne 0x33a                                
  02da  c41e625e         les bx, ptr [0x5e62]                     
  02de  268b5f02         mov bx, word ptr es:[bx + 2]             
  02e2  69dbe000         imul bx, bx, 0xe0                        
  02e6  8b36625e         mov si, word ptr [0x5e62]                
  02ea  268b04           mov ax, word ptr es:[si]                 
  02ed  d1e0             shl ax, 1                                
  02ef  03d8             add bx, ax                               
  02f1  b81d1e           mov ax, 0x1e1d                           
  02f4  8ec0             mov es, ax                               
  02f6  268a9f0000       mov bl, byte ptr es:[bx]                 
  02fb  81e3ff00         and bx, 0xff                             
  02ff  b8042c           mov ax, 0x2c04                           
  0302  8ec0             mov es, ax                               
  0304  2680bf10070b     cmp byte ptr es:[bx + 0x710], 0xb        
  030a  752e             jne 0x33a                                
  030c  c41e625e         les bx, ptr [0x5e62]                     
  0310  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  0315  7523             jne 0x33a                                
  0317  b8042c           mov ax, 0x2c04                           
  031a  8ec0             mov es, ax                               
  031c  26800e340180     or byte ptr es:[0x134], 0x80             
  0322  666819000500     push 0x50019                             
  0328  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  032d  83c404           add sp, 4                                
  0330  52               push dx                                  
  0331  50               push ax                                  
  0332  9ac000d730       lcall 0x30d7, 0xc0                       -> ovl61:168d
  0337  83c404           add sp, 4                                
  033a  b80100           mov ax, 1                                
  033d  5f               pop di                                   
  033e  5e               pop si                                   
  033f  c9               leave                                    
  0340  cb               retf                                     

ovl67_0341:  ; ENTRY
  0341  55               push bp                                  
  0342  8bec             mov bp, sp                               
  0344  83ec04           sub sp, 4                                
  0347  9a8400e830       lcall 0x30e8, 0x84                       -> ovl62:0af3
  034c  9a3d007b07       lcall 0x77b, 0x3d                        -> 077b:003d
  0351  90               nop                                      
  0352  0e               push cs                                  
  0353  e86e02           call 0x5c4                               
  0356  8956fe           mov word ptr [bp - 2], dx                
  0359  8946fc           mov word ptr [bp - 4], ax                
  035c  66837efc00       cmp dword ptr [bp - 4], 0                
  0361  7510             jne 0x373                                
  0363  66c706625e000000 mov dword ptr [0x5e62], 0                
  036c  9a2500ba30       lcall 0x30ba, 0x25                       -> ovl58:0b5f
  0371  eb11             jmp 0x384                                
  0373  66ff76fc         push dword ptr [bp - 4]                  
  0377  90               nop                                      
  0378  0e               push cs                                  
  0379  e86f03           call 0x6eb                               
  037c  83c404           add sp, 4                                
  037f  9a3900ba30       lcall 0x30ba, 0x39                       -> ovl58:0b79
  0384  9a34000c31       lcall 0x310c, 0x34                       -> ovl66:0356
  0389  9a6100d730       lcall 0x30d7, 0x61                       -> ovl61:0174
  038e  b80100           mov ax, 1                                
  0391  c9               leave                                    
  0392  cb               retf                                     

ovl67_0393:  ; ENTRY
  0393  55               push bp                                  
  0394  8bec             mov bp, sp                               
  0396  9a3d007b07       lcall 0x77b, 0x3d                        -> 077b:003d
  039b  90               nop                                      
  039c  0e               push cs                                  
  039d  e85b05           call 0x8fb                               
  03a0  0e               push cs                                  
  03a1  e8f7fd           call 0x19b                               
  03a4  5d               pop bp                                   
  03a5  cb               retf                                     

ovl67_03a6:  ; ENTRY
  03a6  55               push bp                                  
  03a7  8bec             mov bp, sp                               
  03a9  66833e625e00     cmp dword ptr [0x5e62], 0                
  03af  7504             jne 0x3b5                                
  03b1  33c0             xor ax, ax                               
  03b3  eb57             jmp 0x40c                                
  03b5  9a3d007b07       lcall 0x77b, 0x3d                        -> 077b:003d
  03ba  833eda2b00       cmp word ptr [0x2bda], 0                 
  03bf  7510             jne 0x3d1                                
  03c1  c41e625e         les bx, ptr [0x5e62]                     
  03c5  2683670cfe       and word ptr es:[bx + 0xc], 0xfffe       
  03ca  26c6471101       mov byte ptr es:[bx + 0x11], 1           
  03cf  eb37             jmp 0x408                                
  03d1  ba0800           mov dx, 8                                
  03d4  eb2b             jmp 0x401                                
  03d6  8bda             mov bx, dx                               
  03d8  c1e302           shl bx, 2                                
  03db  8b873e5e         mov ax, word ptr [bx + 0x5e3e]           
  03df  0b87405e         or ax, word ptr [bx + 0x5e40]            
  03e3  741c             je 0x401                                 
  03e5  8bda             mov bx, dx                               
  03e7  c1e302           shl bx, 2                                
  03ea  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  03ee  2683670cfe       and word ptr es:[bx + 0xc], 0xfffe       
  03f3  8bda             mov bx, dx                               
  03f5  c1e302           shl bx, 2                                
  03f8  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  03fc  26c6471101       mov byte ptr es:[bx + 0x11], 1           
  0401  8bc2             mov ax, dx                               
  0403  4a               dec dx                                   
  0404  0bc0             or ax, ax                                
  0406  75ce             jne 0x3d6                                
  0408  0e               push cs                                  
  0409  e88ffd           call 0x19b                               
  040c  5d               pop bp                                   
  040d  cb               retf                                     

ovl67_040e:  ; ENTRY
  040e  55               push bp                                  
  040f  8bec             mov bp, sp                               
  0411  83ec06           sub sp, 6                                
  0414  56               push si                                  
  0415  57               push di                                  
  0416  bfffff           mov di, 0xffff                           
  0419  c746feffff       mov word ptr [bp - 2], 0xffff            
  041e  c746fc1027       mov word ptr [bp - 4], 0x2710            
  0423  c746fa1027       mov word ptr [bp - 6], 0x2710            
  0428  b8042c           mov ax, 0x2c04                           
  042b  8ec0             mov es, ax                               
  042d  268b0e8101       mov cx, word ptr es:[0x181]              
  0432  e9c200           jmp 0x4f7                                
  0435  8bd9             mov bx, cx                               
  0437  6bdb16           imul bx, bx, 0x16                        
  043a  b81d1e           mov ax, 0x1e1d                           
  043d  8ec0             mov es, ax                               
  043f  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0444  ba042c           mov dx, 0x2c04                           
  0447  8ec2             mov es, dx                               
  0449  263a061001       cmp al, byte ptr es:[0x110]              
  044e  7403             je 0x453                                 
  0450  e9a400           jmp 0x4f7                                
  0453  8bd9             mov bx, cx                               
  0455  6bdb16           imul bx, bx, 0x16                        
  0458  b81d1e           mov ax, 0x1e1d                           
  045b  8ec0             mov es, ax                               
  045d  2683bf808800     cmp word ptr es:[bx - 0x7780], 0         
  0463  7d03             jge 0x468                                
  0465  e98f00           jmp 0x4f7                                
  0468  8bd9             mov bx, cx                               
  046a  6bdb16           imul bx, bx, 0x16                        
  046d  b81d1e           mov ax, 0x1e1d                           
  0470  8ec0             mov es, ax                               
  0472  26f7878c880100   test word ptr es:[bx - 0x7774], 1        
  0479  747c             je 0x4f7                                 
  047b  8bd9             mov bx, cx                               
  047d  6bdb16           imul bx, bx, 0x16                        
  0480  8ec0             mov es, ax                               
  0482  26f7878c884000   test word ptr es:[bx - 0x7774], 0x40     
  0489  756c             jne 0x4f7                                
  048b  8bd9             mov bx, cx                               
  048d  6bdb16           imul bx, bx, 0x16                        
  0490  b81d1e           mov ax, 0x1e1d                           
  0493  ba0000           mov dx, 0                                
  0496  81c28088         add dx, 0x8880                           
  049a  03da             add bx, dx                               
  049c  8ec0             mov es, ax                               
  049e  268b07           mov ax, word ptr es:[bx]                 
  04a1  2b065032         sub ax, word ptr [0x3250]                
  04a5  99               cdq                                      
  04a6  33c2             xor ax, dx                               
  04a8  2bc2             sub ax, dx                               
  04aa  8bd9             mov bx, cx                               
  04ac  6bdb16           imul bx, bx, 0x16                        
  04af  ba1d1e           mov dx, 0x1e1d                           
  04b2  8ec2             mov es, dx                               
  04b4  50               push ax                                  
  04b5  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  04ba  2b065232         sub ax, word ptr [0x3252]                
  04be  99               cdq                                      
  04bf  33c2             xor ax, dx                               
  04c1  2bc2             sub ax, dx                               
  04c3  5e               pop si                                   
  04c4  03f0             add si, ax                               
  04c6  0bf6             or si, si                                
  04c8  7503             jne 0x4cd                                
  04ca  be2823           mov si, 0x2328                           
  04cd  8bd9             mov bx, cx                               
  04cf  6bdb16           imul bx, bx, 0x16                        
  04d2  b81d1e           mov ax, 0x1e1d                           
  04d5  8ec0             mov es, ax                               
  04d7  26f7878c880002   test word ptr es:[bx - 0x7774], 0x200    
  04de  740d             je 0x4ed                                 
  04e0  3b76fa           cmp si, word ptr [bp - 6]                
  04e3  7d12             jge 0x4f7                                
  04e5  894efe           mov word ptr [bp - 2], cx                
  04e8  8976fa           mov word ptr [bp - 6], si                
  04eb  eb0a             jmp 0x4f7                                
  04ed  3b76fc           cmp si, word ptr [bp - 4]                
  04f0  7d05             jge 0x4f7                                
  04f2  8bf9             mov di, cx                               
  04f4  8976fc           mov word ptr [bp - 4], si                
  04f7  8bc1             mov ax, cx                               
  04f9  49               dec cx                                   
  04fa  0bc0             or ax, ax                                
  04fc  7403             je 0x501                                 
  04fe  e934ff           jmp 0x435                                
  0501  83ffff           cmp di, -1                               
  0504  743e             je 0x544                                 
  0506  8bdf             mov bx, di                               
  0508  6bdb16           imul bx, bx, 0x16                        
  050b  b81d1e           mov ax, 0x1e1d                           
  050e  ba0000           mov dx, 0                                
  0511  81c28088         add dx, 0x8880                           
  0515  03da             add bx, dx                               
  0517  8ec0             mov es, ax                               
  0519  268b07           mov ax, word ptr es:[bx]                 
  051c  a35032           mov word ptr [0x3250], ax                
  051f  8bdf             mov bx, di                               
  0521  6bdb16           imul bx, bx, 0x16                        
  0524  b81d1e           mov ax, 0x1e1d                           
  0527  8ec0             mov es, ax                               
  0529  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  052e  a35232           mov word ptr [0x3252], ax                
  0531  8bc7             mov ax, di                               
  0533  6bc016           imul ax, ax, 0x16                        
  0536  ba1d1e           mov dx, 0x1e1d                           
  0539  bb0000           mov bx, 0                                
  053c  81c38088         add bx, 0x8880                           
  0540  03c3             add ax, bx                               
  0542  eb7c             jmp 0x5c0                                
  0544  837efeff         cmp word ptr [bp - 2], -1                
  0548  7472             je 0x5bc                                 
  054a  8b5efe           mov bx, word ptr [bp - 2]                
  054d  6bdb16           imul bx, bx, 0x16                        
  0550  b81d1e           mov ax, 0x1e1d                           
  0553  ba0000           mov dx, 0                                
  0556  81c28088         add dx, 0x8880                           
  055a  03da             add bx, dx                               
  055c  8ec0             mov es, ax                               
  055e  268b07           mov ax, word ptr es:[bx]                 
  0561  a35032           mov word ptr [0x3250], ax                
  0564  8b5efe           mov bx, word ptr [bp - 2]                
  0567  6bdb16           imul bx, bx, 0x16                        
  056a  b81d1e           mov ax, 0x1e1d                           
  056d  8ec0             mov es, ax                               
  056f  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  0574  a35232           mov word ptr [0x3252], ax                
  0577  b8042c           mov ax, 0x2c04                           
  057a  8ec0             mov es, ax                               
  057c  268b0e8101       mov cx, word ptr es:[0x181]              
  0581  eb2c             jmp 0x5af                                
  0583  8bd9             mov bx, cx                               
  0585  6bdb16           imul bx, bx, 0x16                        
  0588  b81d1e           mov ax, 0x1e1d                           
  058b  8ec0             mov es, ax                               
  058d  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0592  ba042c           mov dx, 0x2c04                           
  0595  8ec2             mov es, dx                               
  0597  263a061001       cmp al, byte ptr es:[0x110]              
  059c  7511             jne 0x5af                                
  059e  8bd9             mov bx, cx                               
  05a0  6bdb16           imul bx, bx, 0x16                        
  05a3  b81d1e           mov ax, 0x1e1d                           
  05a6  8ec0             mov es, ax                               
  05a8  2681a78c88fffd   and word ptr es:[bx - 0x7774], 0xfdff    
  05af  8bc1             mov ax, cx                               
  05b1  49               dec cx                                   
  05b2  0bc0             or ax, ax                                
  05b4  75cd             jne 0x583                                
  05b6  8b46fe           mov ax, word ptr [bp - 2]                
  05b9  e977ff           jmp 0x533                                
  05bc  33d2             xor dx, dx                               
  05be  33c0             xor ax, ax                               
  05c0  5f               pop di                                   
  05c1  5e               pop si                                   
  05c2  c9               leave                                    
  05c3  cb               retf                                     

ovl67_05c4:  ; ENTRY
  05c4  55               push bp                                  
  05c5  8bec             mov bp, sp                               
  05c7  83ec02           sub sp, 2                                
  05ca  56               push si                                  
  05cb  57               push di                                  
  05cc  beffff           mov si, 0xffff                           
  05cf  c746fe1027       mov word ptr [bp - 2], 0x2710            
  05d4  b8042c           mov ax, 0x2c04                           
  05d7  8ec0             mov es, ax                               
  05d9  268b0e8101       mov cx, word ptr es:[0x181]              
  05de  e9b500           jmp 0x696                                
  05e1  8bd9             mov bx, cx                               
  05e3  6bdb16           imul bx, bx, 0x16                        
  05e6  b81d1e           mov ax, 0x1e1d                           
  05e9  8ec0             mov es, ax                               
  05eb  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  05f0  ba042c           mov dx, 0x2c04                           
  05f3  8ec2             mov es, dx                               
  05f5  263a061001       cmp al, byte ptr es:[0x110]              
  05fa  7403             je 0x5ff                                 
  05fc  e99700           jmp 0x696                                
  05ff  8bd9             mov bx, cx                               
  0601  6bdb16           imul bx, bx, 0x16                        
  0604  b81d1e           mov ax, 0x1e1d                           
  0607  8ec0             mov es, ax                               
  0609  2683bf808800     cmp word ptr es:[bx - 0x7780], 0         
  060f  7d03             jge 0x614                                
  0611  e98200           jmp 0x696                                
  0614  8bd9             mov bx, cx                               
  0616  6bdb16           imul bx, bx, 0x16                        
  0619  b81d1e           mov ax, 0x1e1d                           
  061c  8ec0             mov es, ax                               
  061e  26f7878c880100   test word ptr es:[bx - 0x7774], 1        
  0625  746f             je 0x696                                 
  0627  8bd9             mov bx, cx                               
  0629  6bdb16           imul bx, bx, 0x16                        
  062c  8ec0             mov es, ax                               
  062e  26f7878c884000   test word ptr es:[bx - 0x7774], 0x40     
  0635  755f             jne 0x696                                
  0637  8bd9             mov bx, cx                               
  0639  6bdb16           imul bx, bx, 0x16                        
  063c  b81d1e           mov ax, 0x1e1d                           
  063f  ba0000           mov dx, 0                                
  0642  81c28088         add dx, 0x8880                           
  0646  03da             add bx, dx                               
  0648  8ec0             mov es, ax                               
  064a  268b07           mov ax, word ptr es:[bx]                 
  064d  2b065032         sub ax, word ptr [0x3250]                
  0651  99               cdq                                      
  0652  33c2             xor ax, dx                               
  0654  2bc2             sub ax, dx                               
  0656  8bd9             mov bx, cx                               
  0658  6bdb16           imul bx, bx, 0x16                        
  065b  ba1d1e           mov dx, 0x1e1d                           
  065e  8ec2             mov es, dx                               
  0660  50               push ax                                  
  0661  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  0666  2b065232         sub ax, word ptr [0x3252]                
  066a  99               cdq                                      
  066b  33c2             xor ax, dx                               
  066d  2bc2             sub ax, dx                               
  066f  5f               pop di                                   
  0670  03f8             add di, ax                               
  0672  0bff             or di, di                                
  0674  7503             jne 0x679                                
  0676  bf2823           mov di, 0x2328                           
  0679  8bd9             mov bx, cx                               
  067b  6bdb16           imul bx, bx, 0x16                        
  067e  b81d1e           mov ax, 0x1e1d                           
  0681  8ec0             mov es, ax                               
  0683  26f7878c880002   test word ptr es:[bx - 0x7774], 0x200    
  068a  750a             jne 0x696                                
  068c  3b7efe           cmp di, word ptr [bp - 2]                
  068f  7d05             jge 0x696                                
  0691  8bf1             mov si, cx                               
  0693  897efe           mov word ptr [bp - 2], di                
  0696  8bc1             mov ax, cx                               
  0698  49               dec cx                                   
  0699  0bc0             or ax, ax                                
  069b  7403             je 0x6a0                                 
  069d  e941ff           jmp 0x5e1                                
  06a0  83feff           cmp si, -1                               
  06a3  743e             je 0x6e3                                 
  06a5  8bde             mov bx, si                               
  06a7  6bdb16           imul bx, bx, 0x16                        
  06aa  b81d1e           mov ax, 0x1e1d                           
  06ad  ba0000           mov dx, 0                                
  06b0  81c28088         add dx, 0x8880                           
  06b4  03da             add bx, dx                               
  06b6  8ec0             mov es, ax                               
  06b8  268b07           mov ax, word ptr es:[bx]                 
  06bb  a35032           mov word ptr [0x3250], ax                
  06be  8bde             mov bx, si                               
  06c0  6bdb16           imul bx, bx, 0x16                        
  06c3  b81d1e           mov ax, 0x1e1d                           
  06c6  8ec0             mov es, ax                               
  06c8  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  06cd  a35232           mov word ptr [0x3252], ax                
  06d0  8bc6             mov ax, si                               
  06d2  6bc016           imul ax, ax, 0x16                        
  06d5  ba1d1e           mov dx, 0x1e1d                           
  06d8  bb0000           mov bx, 0                                
  06db  81c38088         add bx, 0x8880                           
  06df  03c3             add ax, bx                               
  06e1  eb04             jmp 0x6e7                                
  06e3  33d2             xor dx, dx                               
  06e5  33c0             xor ax, ax                               
  06e7  5f               pop di                                   
  06e8  5e               pop si                                   
  06e9  c9               leave                                    
  06ea  cb               retf                                     

ovl67_06eb:  ; ENTRY
  06eb  55               push bp                                  
  06ec  8bec             mov bp, sp                               
  06ee  83ec0c           sub sp, 0xc                              
  06f1  56               push si                                  
  06f2  57               push di                                  
  06f3  33f6             xor si, si                               
  06f5  c746faffff       mov word ptr [bp - 6], 0xffff            
  06fa  c746f80000       mov word ptr [bp - 8], 0                 
  06ff  b8042c           mov ax, 0x2c04                           
  0702  8ec0             mov es, ax                               
  0704  26ff361001       push word ptr es:[0x110]                 
  0709  9a2400620b       lcall 0xb62, 0x24                        -> 0b62:0024
  070e  59               pop cx                                   
  070f  8956f6           mov word ptr [bp - 0xa], dx              
  0712  8946f4           mov word ptr [bp - 0xc], ax              
  0715  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  071a  0bc0             or ax, ax                                
  071c  751b             jne 0x739                                
  071e  c45e06           les bx, ptr [bp + 6]                     
  0721  26ff7702         push word ptr es:[bx + 2]                
  0725  26ff37           push word ptr es:[bx]                    
  0728  9aa00e620b       lcall 0xb62, 0xea0                       -> 0b62:0ea0
  072d  83c404           add sp, 4                                
  0730  0bc0             or ax, ax                                
  0732  7405             je 0x739                                 
  0734  33c0             xor ax, ax                               
  0736  e9be01           jmp 0x8f7                                
  0739  c45e06           les bx, ptr [bp + 6]                     
  073c  268a4711         mov al, byte ptr es:[bx + 0x11]          
  0740  b400             mov ah, 0                                
  0742  8bf8             mov di, ax                               
  0744  268b07           mov ax, word ptr es:[bx]                 
  0747  8946fe           mov word ptr [bp - 2], ax                
  074a  268b4702         mov ax, word ptr es:[bx + 2]             
  074e  8946fc           mov word ptr [bp - 4], ax                
  0751  ba0800           mov dx, 8                                
  0754  eb11             jmp 0x767                                
  0756  8bda             mov bx, dx                               
  0758  c1e302           shl bx, 2                                
  075b  c787405e0000     mov word ptr [bx + 0x5e40], 0            
  0761  c7873e5e0000     mov word ptr [bx + 0x5e3e], 0            
  0767  8bc2             mov ax, dx                               
  0769  4a               dec dx                                   
  076a  0bc0             or ax, ax                                
  076c  75e8             jne 0x756                                
  076e  b8042c           mov ax, 0x2c04                           
  0771  8ec0             mov es, ax                               
  0773  268b0e8101       mov cx, word ptr es:[0x181]              
  0778  e9eb00           jmp 0x866                                
  077b  8bd9             mov bx, cx                               
  077d  6bdb16           imul bx, bx, 0x16                        
  0780  b81d1e           mov ax, 0x1e1d                           
  0783  8ec0             mov es, ax                               
  0785  268b878088       mov ax, word ptr es:[bx - 0x7780]        
  078a  3b46fe           cmp ax, word ptr [bp - 2]                
  078d  7403             je 0x792                                 
  078f  e9d400           jmp 0x866                                
  0792  8bd9             mov bx, cx                               
  0794  6bdb16           imul bx, bx, 0x16                        
  0797  b81d1e           mov ax, 0x1e1d                           
  079a  8ec0             mov es, ax                               
  079c  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  07a1  3b46fc           cmp ax, word ptr [bp - 4]                
  07a4  7403             je 0x7a9                                 
  07a6  e9bd00           jmp 0x866                                
  07a9  8bd9             mov bx, cx                               
  07ab  6bdb16           imul bx, bx, 0x16                        
  07ae  b81d1e           mov ax, 0x1e1d                           
  07b1  8ec0             mov es, ax                               
  07b3  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  07b8  ba042c           mov dx, 0x2c04                           
  07bb  8ec2             mov es, dx                               
  07bd  263a061001       cmp al, byte ptr es:[0x110]              
  07c2  7403             je 0x7c7                                 
  07c4  e99f00           jmp 0x866                                
  07c7  8bd9             mov bx, cx                               
  07c9  6bdb16           imul bx, bx, 0x16                        
  07cc  b81d1e           mov ax, 0x1e1d                           
  07cf  8ec0             mov es, ax                               
  07d1  268a879188       mov al, byte ptr es:[bx - 0x776f]        
  07d6  b400             mov ah, 0                                
  07d8  3bc7             cmp ax, di                               
  07da  7504             jne 0x7e0                                
  07dc  0bff             or di, di                                
  07de  751b             jne 0x7fb                                
  07e0  8bc1             mov ax, cx                               
  07e2  6bc016           imul ax, ax, 0x16                        
  07e5  ba1d1e           mov dx, 0x1e1d                           
  07e8  bb0000           mov bx, 0                                
  07eb  81c38088         add bx, 0x8880                           
  07ef  03c3             add ax, bx                               
  07f1  3b5608           cmp dx, word ptr [bp + 8]                
  07f4  7570             jne 0x866                                
  07f6  3b4606           cmp ax, word ptr [bp + 6]                
  07f9  756b             jne 0x866                                
  07fb  8bd9             mov bx, cx                               
  07fd  6bdb16           imul bx, bx, 0x16                        
  0800  b81d1e           mov ax, 0x1e1d                           
  0803  8ec0             mov es, ax                               
  0805  26818f8c880002   or word ptr es:[bx - 0x7774], 0x200      
  080c  8bc1             mov ax, cx                               
  080e  6bc016           imul ax, ax, 0x16                        
  0811  ba0000           mov dx, 0                                
  0814  81c28088         add dx, 0x8880                           
  0818  03c2             add ax, dx                               
  081a  8bde             mov bx, si                               
  081c  c1e302           shl bx, 2                                
  081f  c787405e1d1e     mov word ptr [bx + 0x5e40], 0x1e1d       
  0825  89873e5e         mov word ptr [bx + 0x5e3e], ax           
  0829  46               inc si                                   
  082a  8bd9             mov bx, cx                               
  082c  6bdb16           imul bx, bx, 0x16                        
  082f  b81d1e           mov ax, 0x1e1d                           
  0832  8ec0             mov es, ax                               
  0834  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0839  98               cwde                                     
  083a  c45ef4           les bx, ptr [bp - 0xc]                   
  083d  03d8             add bx, ax                               
  083f  268a07           mov al, byte ptr es:[bx]                 
  0842  3a46fa           cmp al, byte ptr [bp - 6]                
  0845  7e1f             jle 0x866                                
  0847  8bd9             mov bx, cx                               
  0849  6bdb16           imul bx, bx, 0x16                        
  084c  b81d1e           mov ax, 0x1e1d                           
  084f  8ec0             mov es, ax                               
  0851  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0856  98               cwde                                     
  0857  c45ef4           les bx, ptr [bp - 0xc]                   
  085a  03d8             add bx, ax                               
  085c  268a07           mov al, byte ptr es:[bx]                 
  085f  98               cwde                                     
  0860  8946fa           mov word ptr [bp - 6], ax                
  0863  894ef8           mov word ptr [bp - 8], cx                
  0866  8bc1             mov ax, cx                               
  0868  49               dec cx                                   
  0869  0bc0             or ax, ax                                
  086b  7403             je 0x870                                 
  086d  e90bff           jmp 0x77b                                
  0870  8b46f8           mov ax, word ptr [bp - 8]                
  0873  6bc016           imul ax, ax, 0x16                        
  0876  ba0000           mov dx, 0                                
  0879  81c28088         add dx, 0x8880                           
  087d  03c2             add ax, dx                               
  087f  c706645e1d1e     mov word ptr [0x5e64], 0x1e1d            
  0885  a3625e           mov word ptr [0x5e62], ax                
  0888  9a29058c0c       lcall 0xc8c, 0x529                       -> 0c8c:0529
  088d  9ace09620b       lcall 0xb62, 0x9ce                       -> 0b62:09ce
  0892  9a2a000c31       lcall 0x310c, 0x2a                       -> ovl66:0000
  0897  9a8400e830       lcall 0x30e8, 0x84                       -> ovl62:0af3
  089c  6a01             push 1                                   
  089e  90               nop                                      
  089f  0e               push cs                                  
  08a0  e8b200           call 0x955                               
  08a3  59               pop cx                                   
  08a4  b8042c           mov ax, 0x2c04                           
  08a7  8ec0             mov es, ax                               
  08a9  268b1e1001       mov bx, word ptr es:[0x110]              
  08ae  d1e3             shl bx, 1                                
  08b0  b8042c           mov ax, 0x2c04                           
  08b3  8ec0             mov es, ax                               
  08b5  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  08bb  7432             je 0x8ef                                 
  08bd  b8042c           mov ax, 0x2c04                           
  08c0  8ec0             mov es, ax                               
  08c2  26833e590100     cmp word ptr es:[0x159], 0               
  08c8  742a             je 0x8f4                                 
  08ca  833e543200       cmp word ptr [0x3254], 0                 
  08cf  741e             je 0x8ef                                 
  08d1  6a01             push 1                                   
  08d3  c41e625e         les bx, ptr [0x5e62]                     
  08d7  26ff7702         push word ptr es:[bx + 2]                
  08db  26ff37           push word ptr es:[bx]                    
  08de  9aac00f930       lcall 0x30f9, 0xac                       -> ovl64:1055
  08e3  83c406           add sp, 6                                
  08e6  8bd8             mov bx, ax                               
  08e8  80bf562d0e       cmp byte ptr [bx + 0x2d56], 0xe          
  08ed  7405             je 0x8f4                                 
  08ef  9a4800f930       lcall 0x30f9, 0x48                       -> ovl64:05b4
  08f4  b80100           mov ax, 1                                
  08f7  5f               pop di                                   
  08f8  5e               pop si                                   
  08f9  c9               leave                                    
  08fa  cb               retf                                     

ovl67_08fb:  ; ENTRY
  08fb  55               push bp                                  
  08fc  8bec             mov bp, sp                               
  08fe  66833e625e00     cmp dword ptr [0x5e62], 0                
  0904  7504             jne 0x90a                                
  0906  33c0             xor ax, ax                               
  0908  eb49             jmp 0x953                                
  090a  833eda2b00       cmp word ptr [0x2bda], 0                 
  090f  750b             jne 0x91c                                
  0911  c41e625e         les bx, ptr [0x5e62]                     
  0915  26834f0c40       or word ptr es:[bx + 0xc], 0x40          
  091a  eb34             jmp 0x950                                
  091c  ba0800           mov dx, 8                                
  091f  eb1d             jmp 0x93e                                
  0921  8bda             mov bx, dx                               
  0923  c1e302           shl bx, 2                                
  0926  8b873e5e         mov ax, word ptr [bx + 0x5e3e]           
  092a  0b87405e         or ax, word ptr [bx + 0x5e40]            
  092e  740e             je 0x93e                                 
  0930  8bda             mov bx, dx                               
  0932  c1e302           shl bx, 2                                
  0935  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  0939  26834f0c40       or word ptr es:[bx + 0xc], 0x40          
  093e  8bc2             mov ax, dx                               
  0940  4a               dec dx                                   
  0941  0bc0             or ax, ax                                
  0943  75dc             jne 0x921                                
  0945  c706a62e0000     mov word ptr [0x2ea6], 0                 
  094b  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  0950  b80100           mov ax, 1                                
  0953  5d               pop bp                                   
  0954  cb               retf                                     

ovl67_0955:  ; ENTRY
  0955  55               push bp                                  
  0956  8bec             mov bp, sp                               
  0958  8b5606           mov dx, word ptr [bp + 6]                
  095b  66833e425e00     cmp dword ptr [0x5e42], 0                
  0961  7504             jne 0x967                                
  0963  33c0             xor ax, ax                               
  0965  eb02             jmp 0x969                                
  0967  8bc2             mov ax, dx                               
  0969  a3da2b           mov word ptr [0x2bda], ax                
  096c  66c7065e5e000000 mov dword ptr [0x5e5e], 0                
  0975  0bd2             or dx, dx                                
  0977  751c             jne 0x995                                
  0979  c41e625e         les bx, ptr [0x5e62]                     
  097d  26834f0c01       or word ptr es:[bx + 0xc], 1             
  0982  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  0987  7559             jne 0x9e2                                
  0989  66a1625e         mov eax, dword ptr [0x5e62]              
  098d  66a35e5e         mov dword ptr [0x5e5e], eax              
  0991  eb4f             jmp 0x9e2                                
  0993  eb4d             jmp 0x9e2                                
  0995  b90800           mov cx, 8                                
  0998  eb41             jmp 0x9db                                
  099a  8bd9             mov bx, cx                               
  099c  c1e302           shl bx, 2                                
  099f  8b873e5e         mov ax, word ptr [bx + 0x5e3e]           
  09a3  0b87405e         or ax, word ptr [bx + 0x5e40]            
  09a7  7432             je 0x9db                                 
  09a9  8bd9             mov bx, cx                               
  09ab  c1e302           shl bx, 2                                
  09ae  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  09b2  26834f0c01       or word ptr es:[bx + 0xc], 1             
  09b7  8bd9             mov bx, cx                               
  09b9  c1e302           shl bx, 2                                
  09bc  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  09c0  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  09c5  7514             jne 0x9db                                
  09c7  8bd9             mov bx, cx                               
  09c9  c1e302           shl bx, 2                                
  09cc  8b87405e         mov ax, word ptr [bx + 0x5e40]           
  09d0  8b973e5e         mov dx, word ptr [bx + 0x5e3e]           
  09d4  a3605e           mov word ptr [0x5e60], ax                
  09d7  89165e5e         mov word ptr [0x5e5e], dx                
  09db  8bc1             mov ax, cx                               
  09dd  49               dec cx                                   
  09de  0bc0             or ax, ax                                
  09e0  75b8             jne 0x99a                                
  09e2  b80100           mov ax, 1                                
  09e5  5d               pop bp                                   
  09e6  cb               retf                                     

ovl67_09e7:  ; ENTRY
  09e7  55               push bp                                  
  09e8  8bec             mov bp, sp                               
  09ea  83ec06           sub sp, 6                                
  09ed  56               push si                                  
  09ee  57               push di                                  
  09ef  bfffff           mov di, 0xffff                           
  09f2  c746feffff       mov word ptr [bp - 2], 0xffff            
  09f7  c746fc1027       mov word ptr [bp - 4], 0x2710            
  09fc  c746fa1027       mov word ptr [bp - 6], 0x2710            
  0a01  b8042c           mov ax, 0x2c04                           
  0a04  8ec0             mov es, ax                               
  0a06  268b0e8101       mov cx, word ptr es:[0x181]              
  0a0b  e9c200           jmp 0xad0                                
  0a0e  8bd9             mov bx, cx                               
  0a10  6bdb16           imul bx, bx, 0x16                        
  0a13  b81d1e           mov ax, 0x1e1d                           
  0a16  8ec0             mov es, ax                               
  0a18  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0a1d  ba042c           mov dx, 0x2c04                           
  0a20  8ec2             mov es, dx                               
  0a22  263a061001       cmp al, byte ptr es:[0x110]              
  0a27  7403             je 0xa2c                                 
  0a29  e9a400           jmp 0xad0                                
  0a2c  8bd9             mov bx, cx                               
  0a2e  6bdb16           imul bx, bx, 0x16                        
  0a31  b81d1e           mov ax, 0x1e1d                           
  0a34  8ec0             mov es, ax                               
  0a36  2683bf808800     cmp word ptr es:[bx - 0x7780], 0         
  0a3c  7d03             jge 0xa41                                
  0a3e  e98f00           jmp 0xad0                                
  0a41  8bd9             mov bx, cx                               
  0a43  6bdb16           imul bx, bx, 0x16                        
  0a46  b81d1e           mov ax, 0x1e1d                           
  0a49  8ec0             mov es, ax                               
  0a4b  26f7878c880100   test word ptr es:[bx - 0x7774], 1        
  0a52  747c             je 0xad0                                 
  0a54  8bd9             mov bx, cx                               
  0a56  6bdb16           imul bx, bx, 0x16                        
  0a59  8ec0             mov es, ax                               
  0a5b  26f7878c884000   test word ptr es:[bx - 0x7774], 0x40     
  0a62  756c             jne 0xad0                                
  0a64  8bd9             mov bx, cx                               
  0a66  6bdb16           imul bx, bx, 0x16                        
  0a69  b81d1e           mov ax, 0x1e1d                           
  0a6c  ba0000           mov dx, 0                                
  0a6f  81c28088         add dx, 0x8880                           
  0a73  03da             add bx, dx                               
  0a75  8ec0             mov es, ax                               
  0a77  268b07           mov ax, word ptr es:[bx]                 
  0a7a  2b065032         sub ax, word ptr [0x3250]                
  0a7e  99               cdq                                      
  0a7f  33c2             xor ax, dx                               
  0a81  2bc2             sub ax, dx                               
  0a83  8bd9             mov bx, cx                               
  0a85  6bdb16           imul bx, bx, 0x16                        
  0a88  ba1d1e           mov dx, 0x1e1d                           
  0a8b  8ec2             mov es, dx                               
  0a8d  50               push ax                                  
  0a8e  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  0a93  2b065232         sub ax, word ptr [0x3252]                
  0a97  99               cdq                                      
  0a98  33c2             xor ax, dx                               
  0a9a  2bc2             sub ax, dx                               
  0a9c  5e               pop si                                   
  0a9d  03f0             add si, ax                               
  0a9f  0bf6             or si, si                                
  0aa1  7503             jne 0xaa6                                
  0aa3  be2823           mov si, 0x2328                           
  0aa6  8bd9             mov bx, cx                               
  0aa8  6bdb16           imul bx, bx, 0x16                        
  0aab  b81d1e           mov ax, 0x1e1d                           
  0aae  8ec0             mov es, ax                               
  0ab0  26f7878c880002   test word ptr es:[bx - 0x7774], 0x200    
  0ab7  740d             je 0xac6                                 
  0ab9  3b76fa           cmp si, word ptr [bp - 6]                
  0abc  7d12             jge 0xad0                                
  0abe  894efe           mov word ptr [bp - 2], cx                
  0ac1  8976fa           mov word ptr [bp - 6], si                
  0ac4  eb0a             jmp 0xad0                                
  0ac6  3b76fc           cmp si, word ptr [bp - 4]                
  0ac9  7d05             jge 0xad0                                
  0acb  8bf9             mov di, cx                               
  0acd  8976fc           mov word ptr [bp - 4], si                
  0ad0  8bc1             mov ax, cx                               
  0ad2  49               dec cx                                   
  0ad3  0bc0             or ax, ax                                
  0ad5  7403             je 0xada                                 
  0ad7  e934ff           jmp 0xa0e                                
  0ada  83ffff           cmp di, -1                               
  0add  7405             je 0xae4                                 
  0adf  b80100           mov ax, 1                                
  0ae2  eb08             jmp 0xaec                                
  0ae4  837efeff         cmp word ptr [bp - 2], -1                
  0ae8  75f5             jne 0xadf                                
  0aea  33c0             xor ax, ax                               
  0aec  5f               pop di                                   
  0aed  5e               pop si                                   
  0aee  c9               leave                                    
  0aef  cb               retf                                     

ovl67_0af0:  ; ENTRY
  0af0  55               push bp                                  
  0af1  8bec             mov bp, sp                               
  0af3  83ec02           sub sp, 2                                
  0af6  56               push si                                  
  0af7  57               push di                                  
  0af8  bfffff           mov di, 0xffff                           
  0afb  c746fe1027       mov word ptr [bp - 2], 0x2710            
  0b00  b8042c           mov ax, 0x2c04                           
  0b03  8ec0             mov es, ax                               
  0b05  268b0e8101       mov cx, word ptr es:[0x181]              
  0b0a  e9b500           jmp 0xbc2                                
  0b0d  8bd9             mov bx, cx                               
  0b0f  6bdb16           imul bx, bx, 0x16                        
  0b12  b81d1e           mov ax, 0x1e1d                           
  0b15  8ec0             mov es, ax                               
  0b17  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0b1c  ba042c           mov dx, 0x2c04                           
  0b1f  8ec2             mov es, dx                               
  0b21  263a061001       cmp al, byte ptr es:[0x110]              
  0b26  7403             je 0xb2b                                 
  0b28  e99700           jmp 0xbc2                                
  0b2b  8bd9             mov bx, cx                               
  0b2d  6bdb16           imul bx, bx, 0x16                        
  0b30  b81d1e           mov ax, 0x1e1d                           
  0b33  8ec0             mov es, ax                               
  0b35  2683bf808800     cmp word ptr es:[bx - 0x7780], 0         
  0b3b  7d03             jge 0xb40                                
  0b3d  e98200           jmp 0xbc2                                
  0b40  8bd9             mov bx, cx                               
  0b42  6bdb16           imul bx, bx, 0x16                        
  0b45  b81d1e           mov ax, 0x1e1d                           
  0b48  8ec0             mov es, ax                               
  0b4a  26f7878c880100   test word ptr es:[bx - 0x7774], 1        
  0b51  746f             je 0xbc2                                 
  0b53  8bd9             mov bx, cx                               
  0b55  6bdb16           imul bx, bx, 0x16                        
  0b58  8ec0             mov es, ax                               
  0b5a  26f7878c884000   test word ptr es:[bx - 0x7774], 0x40     
  0b61  755f             jne 0xbc2                                
  0b63  8bd9             mov bx, cx                               
  0b65  6bdb16           imul bx, bx, 0x16                        
  0b68  b81d1e           mov ax, 0x1e1d                           
  0b6b  ba0000           mov dx, 0                                
  0b6e  81c28088         add dx, 0x8880                           
  0b72  03da             add bx, dx                               
  0b74  8ec0             mov es, ax                               
  0b76  268b07           mov ax, word ptr es:[bx]                 
  0b79  2b065032         sub ax, word ptr [0x3250]                
  0b7d  99               cdq                                      
  0b7e  33c2             xor ax, dx                               
  0b80  2bc2             sub ax, dx                               
  0b82  8bd9             mov bx, cx                               
  0b84  6bdb16           imul bx, bx, 0x16                        
  0b87  ba1d1e           mov dx, 0x1e1d                           
  0b8a  8ec2             mov es, dx                               
  0b8c  50               push ax                                  
  0b8d  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  0b92  2b065232         sub ax, word ptr [0x3252]                
  0b96  99               cdq                                      
  0b97  33c2             xor ax, dx                               
  0b99  2bc2             sub ax, dx                               
  0b9b  5e               pop si                                   
  0b9c  03f0             add si, ax                               
  0b9e  0bf6             or si, si                                
  0ba0  7503             jne 0xba5                                
  0ba2  be2823           mov si, 0x2328                           
  0ba5  8bd9             mov bx, cx                               
  0ba7  6bdb16           imul bx, bx, 0x16                        
  0baa  b81d1e           mov ax, 0x1e1d                           
  0bad  8ec0             mov es, ax                               
  0baf  26f7878c880002   test word ptr es:[bx - 0x7774], 0x200    
  0bb6  750a             jne 0xbc2                                
  0bb8  3b76fe           cmp si, word ptr [bp - 2]                
  0bbb  7d05             jge 0xbc2                                
  0bbd  8bf9             mov di, cx                               
  0bbf  8976fe           mov word ptr [bp - 2], si                
  0bc2  8bc1             mov ax, cx                               
  0bc4  49               dec cx                                   
  0bc5  0bc0             or ax, ax                                
  0bc7  7403             je 0xbcc                                 
  0bc9  e941ff           jmp 0xb0d                                
  0bcc  83ffff           cmp di, -1                               
  0bcf  7405             je 0xbd6                                 
  0bd1  b80100           mov ax, 1                                
  0bd4  eb02             jmp 0xbd8                                
  0bd6  33c0             xor ax, ax                               
  0bd8  5f               pop di                                   
  0bd9  5e               pop si                                   
  0bda  c9               leave                                    
  0bdb  cb               retf                                     
