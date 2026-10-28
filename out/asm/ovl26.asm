; ovl26 stub 2fe4 file_off 0x51f70 size 0x810

ovl26_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec02           sub sp, 2                                
  0006  56               push si                                  
  0007  8b7606           mov si, word ptr [bp + 6]                
  000a  b8042c           mov ax, 0x2c04                           
  000d  8ec0             mov es, ax                               
  000f  268b1e1001       mov bx, word ptr es:[0x110]              
  0014  d1e3             shl bx, 1                                
  0016  b8042c           mov ax, 0x2c04                           
  0019  8ec0             mov es, ax                               
  001b  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  0021  7424             je 0x47                                  
  0023  8b5e08           mov bx, word ptr [bp + 8]                
  0026  d1e3             shl bx, 1                                
  0028  8ec0             mov es, ax                               
  002a  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  0030  7515             jne 0x47                                 
  0032  c41eee40         les bx, ptr [0x40ee]                     
  0036  26837f4200       cmp word ptr es:[bx + 0x42], 0           
  003b  740a             je 0x47                                  
  003d  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  0042  3d0a00           cmp ax, 0xa                              
  0045  7c04             jl 0x4b                                  
  0047  33c0             xor ax, ax                               
  0049  eb32             jmp 0x7d                                 
  004b  c41eee40         les bx, ptr [0x40ee]                     
  004f  26397746         cmp word ptr es:[bx + 0x46], si          
  0053  74f2             je 0x47                                  
  0055  56               push si                                  
  0056  9a39000530       lcall 0x3005, 0x39                       -> ovl31:07d0
  005b  59               pop cx                                   
  005c  8946fe           mov word ptr [bp - 2], ax                
  005f  817efec800       cmp word ptr [bp - 2], 0xc8               ; "Quest"
  0064  7c09             jl 0x6f                                  
  0066  56               push si                                  
  0067  9a2f00b52f       lcall 0x2fb5, 0x2f                       -> ovl19:199c
  006c  59               pop cx                                   
  006d  eb0b             jmp 0x7a                                 
  006f  6a00             push 0                                   
  0071  56               push si                                  
  0072  9a2a00b52f       lcall 0x2fb5, 0x2a                       -> ovl19:1864
  0077  83c404           add sp, 4                                
  007a  b80100           mov ax, 1                                
  007d  5e               pop si                                   
  007e  c9               leave                                    
  007f  cb               retf                                     

ovl26_0080:  ; ENTRY
  0080  55               push bp                                  
  0081  8bec             mov bp, sp                               
  0083  83ec1e           sub sp, 0x1e                             
  0086  56               push si                                  
  0087  57               push di                                  
  0088  6668f401f401     push 0x1f401f4                           
  008e  6a03             push 3                                   
  0090  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0095  83c406           add sp, 6                                
  0098  8946fe           mov word ptr [bp - 2], ax                
  009b  c746fcffff       mov word ptr [bp - 4], 0xffff            
  00a0  c746faffff       mov word ptr [bp - 6], 0xffff            
  00a5  c746f8ffff       mov word ptr [bp - 8], 0xffff            
  00aa  c746f60000       mov word ptr [bp - 0xa], 0               
  00af  b8042c           mov ax, 0x2c04                           
  00b2  8ec0             mov es, ax                               
  00b4  268b3e7b15       mov di, word ptr es:[0x157b]             
  00b9  e9bd01           jmp 0x279                                
  00bc  8bdf             mov bx, di                               
  00be  6bdb41           imul bx, bx, 0x41                        
  00c1  b8042c           mov ax, 0x2c04                           
  00c4  8ec0             mov es, ax                               
  00c6  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  00cc  7403             je 0xd1                                  
  00ce  e9a801           jmp 0x279                                
  00d1  c41eee40         les bx, ptr [0x40ee]                     
  00d5  03df             add bx, di                               
  00d7  268a871e01       mov al, byte ptr es:[bx + 0x11e]         
  00dc  b400             mov ah, 0                                
  00de  a90100           test ax, 1                               
  00e1  7503             jne 0xe6                                 
  00e3  e99301           jmp 0x279                                
  00e6  16               push ss                                  
  00e7  8d46ea           lea ax, [bp - 0x16]                      
  00ea  50               push ax                                  
  00eb  16               push ss                                  
  00ec  8d46f0           lea ax, [bp - 0x10]                      
  00ef  50               push ax                                  
  00f0  6a00             push 0                                   
  00f2  57               push di                                  
  00f3  9a5c00db2f       lcall 0x2fdb, 0x5c                       -> ovl25:0656
  00f8  83c40c           add sp, 0xc                              
  00fb  33c9             xor cx, cx                               
  00fd  be0600           mov si, 6                                
  0100  eb2a             jmp 0x12c                                
  0102  807af0ff         cmp byte ptr [bp + si - 0x10], 0xff      
  0106  7424             je 0x12c                                 
  0108  8a42f0           mov al, byte ptr [bp + si - 0x10]        
  010b  b400             mov ah, 0                                
  010d  6bc041           imul ax, ax, 0x41                        
  0110  ba042c           mov dx, 0x2c04                           
  0113  8bd8             mov bx, ax                               
  0115  8ec2             mov es, dx                               
  0117  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  011c  98               cwde                                     
  011d  ba042c           mov dx, 0x2c04                           
  0120  8ec2             mov es, dx                               
  0122  263b061001       cmp ax, word ptr es:[0x110]              
  0127  7503             jne 0x12c                                
  0129  b90100           mov cx, 1                                
  012c  8bc6             mov ax, si                               
  012e  4e               dec si                                   
  012f  0bc0             or ax, ax                                
  0131  75cf             jne 0x102                                
  0133  0bc9             or cx, cx                                
  0135  7503             jne 0x13a                                
  0137  e93f01           jmp 0x279                                
  013a  8bdf             mov bx, di                               
  013c  6bdb41           imul bx, bx, 0x41                        
  013f  b8042c           mov ax, 0x2c04                           
  0142  8ec0             mov es, ax                               
  0144  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0149  8946e8           mov word ptr [bp - 0x18], ax             
  014c  8bdf             mov bx, di                               
  014e  6bdb41           imul bx, bx, 0x41                        
  0151  b8042c           mov ax, 0x2c04                           
  0154  8ec0             mov es, ax                               
  0156  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  015b  8946e6           mov word ptr [bp - 0x1a], ax             
  015e  c746e40000       mov word ptr [bp - 0x1c], 0              
  0163  c746e2e803       mov word ptr [bp - 0x1e], 0x3e8          
  0168  b8042c           mov ax, 0x2c04                           
  016b  8ec0             mov es, ax                               
  016d  268b367b15       mov si, word ptr es:[0x157b]             
  0172  e9af00           jmp 0x224                                
  0175  8bde             mov bx, si                               
  0177  6bdb41           imul bx, bx, 0x41                        
  017a  b8042c           mov ax, 0x2c04                           
  017d  8ec0             mov es, ax                               
  017f  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  0185  754b             jne 0x1d2                                
  0187  c41eee40         les bx, ptr [0x40ee]                     
  018b  03de             add bx, si                               
  018d  268a871e01       mov al, byte ptr es:[bx + 0x11e]         
  0192  b400             mov ah, 0                                
  0194  a90100           test ax, 1                               
  0197  7503             jne 0x19c                                
  0199  e98800           jmp 0x224                                
  019c  8bde             mov bx, si                               
  019e  6bdb41           imul bx, bx, 0x41                        
  01a1  b8042c           mov ax, 0x2c04                           
  01a4  8ec0             mov es, ax                               
  01a6  26ffb77f15       push word ptr es:[bx + 0x157f]           
  01ab  8bde             mov bx, si                               
  01ad  6bdb41           imul bx, bx, 0x41                        
  01b0  b8042c           mov ax, 0x2c04                           
  01b3  8ec0             mov es, ax                               
  01b5  26ffb77d15       push word ptr es:[bx + 0x157d]           
  01ba  ff76e6           push word ptr [bp - 0x1a]                
  01bd  ff76e8           push word ptr [bp - 0x18]                
  01c0  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  01c5  83c408           add sp, 8                                
  01c8  3d1400           cmp ax, 0x14                             
  01cb  7d57             jge 0x224                                
  01cd  ff46e4           inc word ptr [bp - 0x1c]                 
  01d0  eb52             jmp 0x224                                
  01d2  8bde             mov bx, si                               
  01d4  6bdb41           imul bx, bx, 0x41                        
  01d7  b8042c           mov ax, 0x2c04                           
  01da  8ec0             mov es, ax                               
  01dc  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  01e1  98               cwde                                     
  01e2  ba042c           mov dx, 0x2c04                           
  01e5  8ec2             mov es, dx                               
  01e7  263b061001       cmp ax, word ptr es:[0x110]              
  01ec  7536             jne 0x224                                
  01ee  8bde             mov bx, si                               
  01f0  6bdb41           imul bx, bx, 0x41                        
  01f3  b8042c           mov ax, 0x2c04                           
  01f6  8ec0             mov es, ax                               
  01f8  26ffb77f15       push word ptr es:[bx + 0x157f]           
  01fd  8bde             mov bx, si                               
  01ff  6bdb41           imul bx, bx, 0x41                        
  0202  b8042c           mov ax, 0x2c04                           
  0205  8ec0             mov es, ax                               
  0207  26ffb77d15       push word ptr es:[bx + 0x157d]           
  020c  ff76e6           push word ptr [bp - 0x1a]                
  020f  ff76e8           push word ptr [bp - 0x18]                
  0212  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  0217  83c408           add sp, 8                                
  021a  8bd0             mov dx, ax                               
  021c  3956e2           cmp word ptr [bp - 0x1e], dx             
  021f  7e03             jle 0x224                                
  0221  8956e2           mov word ptr [bp - 0x1e], dx             
  0224  8bc6             mov ax, si                               
  0226  4e               dec si                                   
  0227  0bc0             or ax, ax                                
  0229  7403             je 0x22e                                 
  022b  e947ff           jmp 0x175                                
  022e  837ee404         cmp word ptr [bp - 0x1c], 4              
  0232  7c45             jl 0x279                                 
  0234  8b46e4           mov ax, word ptr [bp - 0x1c]             
  0237  3b46f8           cmp ax, word ptr [bp - 8]                
  023a  7f0d             jg 0x249                                 
  023c  3b46f8           cmp ax, word ptr [bp - 8]                
  023f  7538             jne 0x279                                
  0241  8b46e2           mov ax, word ptr [bp - 0x1e]             
  0244  3b46f6           cmp ax, word ptr [bp - 0xa]              
  0247  7e30             jle 0x279                                
  0249  8b46e2           mov ax, word ptr [bp - 0x1e]             
  024c  8946f6           mov word ptr [bp - 0xa], ax              
  024f  8b46e4           mov ax, word ptr [bp - 0x1c]             
  0252  8946f8           mov word ptr [bp - 8], ax                
  0255  8bdf             mov bx, di                               
  0257  6bdb41           imul bx, bx, 0x41                        
  025a  b8042c           mov ax, 0x2c04                           
  025d  8ec0             mov es, ax                               
  025f  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0264  8946fc           mov word ptr [bp - 4], ax                
  0267  8bdf             mov bx, di                               
  0269  6bdb41           imul bx, bx, 0x41                        
  026c  b8042c           mov ax, 0x2c04                           
  026f  8ec0             mov es, ax                               
  0271  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0276  8946fa           mov word ptr [bp - 6], ax                
  0279  8bc7             mov ax, di                               
  027b  4f               dec di                                   
  027c  0bc0             or ax, ax                                
  027e  7403             je 0x283                                 
  0280  e939fe           jmp 0xbc                                 
  0283  b8042c           mov ax, 0x2c04                           
  0286  8ec0             mov es, ax                               
  0288  26833e240100     cmp word ptr es:[0x124], 0               
  028e  7503             jne 0x293                                
  0290  e9dc00           jmp 0x36f                                
  0293  837efcff         cmp word ptr [bp - 4], -1                
  0297  7503             jne 0x29c                                
  0299  e9d300           jmp 0x36f                                
  029c  66680b00faff     push 0xfffa000b                          
  02a2  6a01             push 1                                   
  02a4  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  02a9  83c406           add sp, 6                                
  02ac  8bf0             mov si, ax                               
  02ae  66680b00faff     push 0xfffa000b                          
  02b4  6a01             push 1                                   
  02b6  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  02bb  83c406           add sp, 6                                
  02be  8bd0             mov dx, ax                               
  02c0  8b46fc           mov ax, word ptr [bp - 4]                
  02c3  03c6             add ax, si                               
  02c5  7d04             jge 0x2cb                                
  02c7  33c0             xor ax, ax                               
  02c9  eb05             jmp 0x2d0                                
  02cb  8b46fc           mov ax, word ptr [bp - 4]                
  02ce  03c6             add ax, si                               
  02d0  8946fc           mov word ptr [bp - 4], ax                
  02d3  8b46fa           mov ax, word ptr [bp - 6]                
  02d6  03c2             add ax, dx                               
  02d8  7d04             jge 0x2de                                
  02da  33c0             xor ax, ax                               
  02dc  eb05             jmp 0x2e3                                
  02de  8b46fa           mov ax, word ptr [bp - 6]                
  02e1  03c2             add ax, dx                               
  02e3  8946fa           mov word ptr [bp - 6], ax                
  02e6  837efc6f         cmp word ptr [bp - 4], 0x6f              
  02ea  7d05             jge 0x2f1                                
  02ec  8b46fc           mov ax, word ptr [bp - 4]                
  02ef  eb03             jmp 0x2f4                                
  02f1  b86f00           mov ax, 0x6f                             
  02f4  8946fc           mov word ptr [bp - 4], ax                
  02f7  817efa9b00       cmp word ptr [bp - 6], 0x9b              
  02fc  7d05             jge 0x303                                
  02fe  8b46fa           mov ax, word ptr [bp - 6]                
  0301  eb03             jmp 0x306                                
  0303  b89b00           mov ax, 0x9b                             
  0306  8946fa           mov word ptr [bp - 6], ax                
  0309  50               push ax                                  
  030a  ff76fc           push word ptr [bp - 4]                   
  030d  9a48001430       lcall 0x3014, 0x48                       -> ovl34:0cd6
  0312  83c404           add sp, 4                                
  0315  b8042c           mov ax, 0x2c04                           
  0318  8ec0             mov es, ax                               
  031a  26833e590100     cmp word ptr es:[0x159], 0               
  0320  7407             je 0x329                                 
  0322  833e543200       cmp word ptr [0x3254], 0                 
  0327  7419             je 0x342                                 
  0329  b8042c           mov ax, 0x2c04                           
  032c  8ec0             mov es, ax                               
  032e  268b1e1001       mov bx, word ptr es:[0x110]              
  0333  d1e3             shl bx, 1                                
  0335  b8042c           mov ax, 0x2c04                           
  0338  8ec0             mov es, ax                               
  033a  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  0340  7547             jne 0x389                                
  0342  b8042c           mov ax, 0x2c04                           
  0345  8ec0             mov es, ax                               
  0347  26ff361001       push word ptr es:[0x110]                 
  034c  9a5200f230       lcall 0x30f2, 0x52                       -> ovl63:2200
  0351  59               pop cx                                   
  0352  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0357  666a00           push 0                                   
  035a  666801000100     push 0x10001                             
  0360  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  0365  83c408           add sp, 8                                
  0368  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  036d  eb1a             jmp 0x389                                
  036f  b8042c           mov ax, 0x2c04                           
  0372  8ec0             mov es, ax                               
  0374  268b1e1001       mov bx, word ptr es:[0x110]              
  0379  6bdb14           imul bx, bx, 0x14                        
  037c  b8042c           mov ax, 0x2c04                           
  037f  8b56fe           mov dx, word ptr [bp - 2]                
  0382  8ec0             mov es, ax                               
  0384  2601978501       add word ptr es:[bx + 0x185], dx         
  0389  5f               pop di                                   
  038a  5e               pop si                                   
  038b  c9               leave                                    
  038c  cb               retf                                     

ovl26_038d:  ; ENTRY
  038d  55               push bp                                  
  038e  8bec             mov bp, sp                               
  0390  56               push si                                  
  0391  33f6             xor si, si                               
  0393  b8042c           mov ax, 0x2c04                           
  0396  8ec0             mov es, ax                               
  0398  26833e1e0100     cmp word ptr es:[0x11e], 0               
  039e  7503             jne 0x3a3                                
  03a0  e91401           jmp 0x4b7                                
  03a3  8ec0             mov es, ax                               
  03a5  268b1e1001       mov bx, word ptr es:[0x110]              
  03aa  6bdb0c           imul bx, bx, 0xc                         
  03ad  b8042c           mov ax, 0x2c04                           
  03b0  8ec0             mov es, ax                               
  03b2  2683bf031100     cmp word ptr es:[bx + 0x1103], 0         
  03b8  7503             jne 0x3bd                                
  03ba  e9fa00           jmp 0x4b7                                
  03bd  a0c442           mov al, byte ptr [0x42c4]                
  03c0  98               cwde                                     
  03c1  8bc8             mov cx, ax                               
  03c3  eb3a             jmp 0x3ff                                
  03c5  b8042c           mov ax, 0x2c04                           
  03c8  8ec0             mov es, ax                               
  03ca  268b1e1001       mov bx, word ptr es:[0x110]              
  03cf  6bdb0c           imul bx, bx, 0xc                         
  03d2  b8042c           mov ax, 0x2c04                           
  03d5  8ec0             mov es, ax                               
  03d7  268b870711       mov ax, word ptr es:[bx + 0x1107]        
  03dc  6bc016           imul ax, ax, 0x16                        
  03df  ba1d1e           mov dx, 0x1e1d                           
  03e2  bb0000           mov bx, 0                                
  03e5  81c38088         add bx, 0x8880                           
  03e9  03c3             add ax, bx                               
  03eb  8bd9             mov bx, cx                               
  03ed  c1e302           shl bx, 2                                
  03f0  3b97c842         cmp dx, word ptr [bx + 0x42c8]           
  03f4  7509             jne 0x3ff                                
  03f6  3b87c642         cmp ax, word ptr [bx + 0x42c6]           
  03fa  7503             jne 0x3ff                                
  03fc  be0100           mov si, 1                                
  03ff  8bc1             mov ax, cx                               
  0401  49               dec cx                                   
  0402  0bc0             or ax, ax                                
  0404  75bf             jne 0x3c5                                
  0406  0bf6             or si, si                                
  0408  7503             jne 0x40d                                
  040a  e9aa00           jmp 0x4b7                                
  040d  b8042c           mov ax, 0x2c04                           
  0410  8ec0             mov es, ax                               
  0412  268b1e1001       mov bx, word ptr es:[0x110]              
  0417  6bdb0c           imul bx, bx, 0xc                         
  041a  b8042c           mov ax, 0x2c04                           
  041d  8ec0             mov es, ax                               
  041f  2683bf051104     cmp word ptr es:[bx + 0x1105], 4         
  0425  741a             je 0x441                                 
  0427  b8042c           mov ax, 0x2c04                           
  042a  8ec0             mov es, ax                               
  042c  268b1e1001       mov bx, word ptr es:[0x110]              
  0431  6bdb0c           imul bx, bx, 0xc                         
  0434  b8042c           mov ax, 0x2c04                           
  0437  8ec0             mov es, ax                               
  0439  2683bf051105     cmp word ptr es:[bx + 0x1105], 5         
  043f  7576             jne 0x4b7                                
  0441  ff7608           push word ptr [bp + 8]                   
  0444  ff7606           push word ptr [bp + 6]                   
  0447  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  044c  83c404           add sp, 4                                
  044f  8bd0             mov dx, ax                               
  0451  b8042c           mov ax, 0x2c04                           
  0454  8ec0             mov es, ax                               
  0456  268b1e1001       mov bx, word ptr es:[0x110]              
  045b  6bdb0c           imul bx, bx, 0xc                         
  045e  b8042c           mov ax, 0x2c04                           
  0461  8ec0             mov es, ax                               
  0463  2639970911       cmp word ptr es:[bx + 0x1109], dx        
  0468  754d             jne 0x4b7                                
  046a  c41eee40         les bx, ptr [0x40ee]                     
  046e  26ff474a         inc word ptr es:[bx + 0x4a]              
  0472  26c74746ffff     mov word ptr es:[bx + 0x46], 0xffff      
  0478  b8042c           mov ax, 0x2c04                           
  047b  8ec0             mov es, ax                               
  047d  268b1e1001       mov bx, word ptr es:[0x110]              
  0482  6bdb0c           imul bx, bx, 0xc                         
  0485  b8042c           mov ax, 0x2c04                           
  0488  8ec0             mov es, ax                               
  048a  2683bf051105     cmp word ptr es:[bx + 0x1105], 5         
  0490  7515             jne 0x4a7                                
  0492  6a01             push 1                                   
  0494  52               push dx                                  
  0495  9a2a00b52f       lcall 0x2fb5, 0x2a                       -> ovl19:1864
  049a  83c404           add sp, 4                                
  049d  666a00           push 0                                   
  04a0  666a00           push 0                                   
  04a3  6a02             push 2                                   
  04a5  eb08             jmp 0x4af                                
  04a7  666a00           push 0                                   
  04aa  666a00           push 0                                   
  04ad  6a04             push 4                                   
  04af  9a3e005b2f       lcall 0x2f5b, 0x3e                       -> ovl01:1ded
  04b4  83c40a           add sp, 0xa                              
  04b7  5e               pop si                                   
  04b8  5d               pop bp                                   
  04b9  cb               retf                                     

ovl26_04ba:  ; ENTRY
  04ba  55               push bp                                  
  04bb  8bec             mov bp, sp                               
  04bd  56               push si                                  
  04be  c41eee40         les bx, ptr [0x40ee]                     
  04c2  26837f4800       cmp word ptr es:[bx + 0x48], 0           
  04c7  7573             jne 0x53c                                
  04c9  b8042c           mov ax, 0x2c04                           
  04cc  8ec0             mov es, ax                               
  04ce  268b367b15       mov si, word ptr es:[0x157b]             
  04d3  eb60             jmp 0x535                                
  04d5  8bde             mov bx, si                               
  04d7  6bdb41           imul bx, bx, 0x41                        
  04da  b8042c           mov ax, 0x2c04                           
  04dd  8ec0             mov es, ax                               
  04df  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  04e4  98               cwde                                     
  04e5  ba042c           mov dx, 0x2c04                           
  04e8  8ec2             mov es, dx                               
  04ea  263b061001       cmp ax, word ptr es:[0x110]              
  04ef  7544             jne 0x535                                
  04f1  33c9             xor cx, cx                               
  04f3  33d2             xor dx, dx                               
  04f5  eb1a             jmp 0x511                                
  04f7  c41eee40         les bx, ptr [0x40ee]                     
  04fb  03de             add bx, si                               
  04fd  268a4756         mov al, byte ptr es:[bx + 0x56]          
  0501  b400             mov ah, 0                                
  0503  8bda             mov bx, dx                               
  0505  42               inc dx                                   
  0506  d1e3             shl bx, 1                                
  0508  3b873209         cmp ax, word ptr [bx + 0x932]            
  050c  7503             jne 0x511                                
  050e  b90100           mov cx, 1                                
  0511  8bda             mov bx, dx                               
  0513  d1e3             shl bx, 1                                
  0515  83bf3209ff       cmp word ptr [bx + 0x932], -1            
  051a  75db             jne 0x4f7                                
  051c  0bc9             or cx, cx                                
  051e  7415             je 0x535                                 
  0520  c41eee40         les bx, ptr [0x40ee]                     
  0524  03de             add bx, si                               
  0526  2680bf820104     cmp byte ptr es:[bx + 0x182], 4          
  052c  7207             jb 0x535                                 
  052e  56               push si                                  
  052f  90               nop                                      
  0530  0e               push cs                                  
  0531  e80b00           call 0x53f                               
  0534  59               pop cx                                   
  0535  8bc6             mov ax, si                               
  0537  4e               dec si                                   
  0538  0bc0             or ax, ax                                
  053a  7599             jne 0x4d5                                
  053c  5e               pop si                                   
  053d  5d               pop bp                                   
  053e  cb               retf                                     

ovl26_053f:  ; ENTRY
  053f  55               push bp                                  
  0540  8bec             mov bp, sp                               
  0542  83ec32           sub sp, 0x32                             
  0545  56               push si                                  
  0546  57               push di                                  
  0547  8b7606           mov si, word ptr [bp + 6]                
  054a  c746faffff       mov word ptr [bp - 6], 0xffff            
  054f  c746f80000       mov word ptr [bp - 8], 0                 
  0554  c746f66400       mov word ptr [bp - 0xa], 0x64            
  0559  c746f20000       mov word ptr [bp - 0xe], 0               
  055e  8bde             mov bx, si                               
  0560  6bdb41           imul bx, bx, 0x41                        
  0563  b8042c           mov ax, 0x2c04                           
  0566  8ec0             mov es, ax                               
  0568  268b8f7d15       mov cx, word ptr es:[bx + 0x157d]        
  056d  8bde             mov bx, si                               
  056f  6bdb41           imul bx, bx, 0x41                        
  0572  b8042c           mov ax, 0x2c04                           
  0575  8ec0             mov es, ax                               
  0577  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  057c  8946f0           mov word ptr [bp - 0x10], ax             
  057f  c41eee40         les bx, ptr [0x40ee]                     
  0583  03de             add bx, si                               
  0585  26807f5607       cmp byte ptr es:[bx + 0x56], 7           
  058a  7401             je 0x58d                                 
  058c  41               inc cx                                   
  058d  c41eee40         les bx, ptr [0x40ee]                     
  0591  03de             add bx, si                               
  0593  26807f5607       cmp byte ptr es:[bx + 0x56], 7           
  0598  7511             jne 0x5ab                                
  059a  8b1eee40         mov bx, word ptr [0x40ee]                
  059e  03de             add bx, si                               
  05a0  2680bf82010c     cmp byte ptr es:[bx + 0x182], 0xc        
  05a6  7303             jae 0x5ab                                
  05a8  e96102           jmp 0x80c                                
  05ab  b8042c           mov ax, 0x2c04                           
  05ae  8ec0             mov es, ax                               
  05b0  268b1e1001       mov bx, word ptr es:[0x110]              
  05b5  6bdb14           imul bx, bx, 0x14                        
  05b8  b8042c           mov ax, 0x2c04                           
  05bb  8ec0             mov es, ax                               
  05bd  2683bf850128     cmp word ptr es:[bx + 0x185], 0x28       
  05c3  7d27             jge 0x5ec                                
  05c5  b8042c           mov ax, 0x2c04                           
  05c8  8ec0             mov es, ax                               
  05ca  268b1e1001       mov bx, word ptr es:[0x110]              
  05cf  d1e3             shl bx, 1                                
  05d1  8b87ca5d         mov ax, word ptr [bx + 0x5dca]           
  05d5  ba042c           mov dx, 0x2c04                           
  05d8  8ec2             mov es, dx                               
  05da  268b1e1001       mov bx, word ptr es:[0x110]              
  05df  d1e3             shl bx, 1                                
  05e1  3b87da5d         cmp ax, word ptr [bx + 0x5dda]           
  05e5  7d05             jge 0x5ec                                
  05e7  b84100           mov ax, 0x41                             
  05ea  eb03             jmp 0x5ef                                
  05ec  b85500           mov ax, 0x55                             
  05ef  8946f4           mov word ptr [bp - 0xc], ax              
  05f2  6a08             push 8                                   
  05f4  16               push ss                                  
  05f5  8d46ce           lea ax, [bp - 0x32]                      
  05f8  50               push ax                                  
  05f9  ff76f0           push word ptr [bp - 0x10]                
  05fc  51               push cx                                  
  05fd  9a5200f72f       lcall 0x2ff7, 0x52                       -> ovl29:12c9
  0602  83c40a           add sp, 0xa                              
  0605  8946fc           mov word ptr [bp - 4], ax                
  0608  0bc0             or ax, ax                                
  060a  7503             jne 0x60f                                
  060c  e9fd01           jmp 0x80c                                
  060f  837efc04         cmp word ptr [bp - 4], 4                 
  0613  7d20             jge 0x635                                
  0615  c41eee40         les bx, ptr [0x40ee]                     
  0619  03de             add bx, si                               
  061b  26807f5606       cmp byte ptr es:[bx + 0x56], 6           
  0620  7503             jne 0x625                                
  0622  e9e701           jmp 0x80c                                
  0625  8b1eee40         mov bx, word ptr [0x40ee]                
  0629  03de             add bx, si                               
  062b  26807f5607       cmp byte ptr es:[bx + 0x56], 7           
  0630  7503             jne 0x635                                
  0632  e9d701           jmp 0x80c                                
  0635  16               push ss                                  
  0636  8d46e4           lea ax, [bp - 0x1c]                      
  0639  50               push ax                                  
  063a  16               push ss                                  
  063b  8d46ea           lea ax, [bp - 0x16]                      
  063e  50               push ax                                  
  063f  6a00             push 0                                   
  0641  56               push si                                  
  0642  9a5c00db2f       lcall 0x2fdb, 0x5c                       -> ovl25:0656
  0647  83c40c           add sp, 0xc                              
  064a  bf0600           mov di, 6                                
  064d  e97c01           jmp 0x7cc                                
  0650  c643de00         mov byte ptr [bp + di - 0x22], 0         
  0654  8a43ea           mov al, byte ptr [bp + di - 0x16]        
  0657  b400             mov ah, 0                                
  0659  8946fe           mov word ptr [bp - 2], ax                
  065c  3dff00           cmp ax, 0xff                             
  065f  7503             jne 0x664                                
  0661  e96801           jmp 0x7cc                                
  0664  c41eee40         les bx, ptr [0x40ee]                     
  0668  035efe           add bx, word ptr [bp - 2]                
  066b  26f6871e0101     test byte ptr es:[bx + 0x11e], 1         
  0671  7403             je 0x676                                 
  0673  e95601           jmp 0x7cc                                
  0676  8b5efe           mov bx, word ptr [bp - 2]                
  0679  6bdb41           imul bx, bx, 0x41                        
  067c  b8042c           mov ax, 0x2c04                           
  067f  8ec0             mov es, ax                               
  0681  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0686  98               cwde                                     
  0687  ba042c           mov dx, 0x2c04                           
  068a  8ec2             mov es, dx                               
  068c  263b061001       cmp ax, word ptr es:[0x110]              
  0691  7503             jne 0x696                                
  0693  e93601           jmp 0x7cc                                
  0696  8b5efe           mov bx, word ptr [bp - 2]                
  0699  6bdb41           imul bx, bx, 0x41                        
  069c  b8042c           mov ax, 0x2c04                           
  069f  8ec0             mov es, ax                               
  06a1  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  06a6  69dbe000         imul bx, bx, 0xe0                        
  06aa  8b76fe           mov si, word ptr [bp - 2]                
  06ad  6bf641           imul si, si, 0x41                        
  06b0  b8042c           mov ax, 0x2c04                           
  06b3  8ec0             mov es, ax                               
  06b5  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  06ba  d1e0             shl ax, 1                                
  06bc  03d8             add bx, ax                               
  06be  b81d1e           mov ax, 0x1e1d                           
  06c1  8ec0             mov es, ax                               
  06c3  268a9f0000       mov bl, byte ptr es:[bx]                 
  06c8  81e3ff00         and bx, 0xff                             
  06cc  b8042c           mov ax, 0x2c04                           
  06cf  8ec0             mov es, ax                               
  06d1  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  06d7  7403             je 0x6dc                                 
  06d9  e9f000           jmp 0x7cc                                
  06dc  c41eee40         les bx, ptr [0x40ee]                     
  06e0  268b4746         mov ax, word ptr es:[bx + 0x46]          
  06e4  3b46fe           cmp ax, word ptr [bp - 2]                
  06e7  7503             jne 0x6ec                                
  06e9  e9e000           jmp 0x7cc                                
  06ec  8b5efe           mov bx, word ptr [bp - 2]                
  06ef  6bdb41           imul bx, bx, 0x41                        
  06f2  b8042c           mov ax, 0x2c04                           
  06f5  8ec0             mov es, ax                               
  06f7  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  06fd  7432             je 0x731                                 
  06ff  8b5efe           mov bx, word ptr [bp - 2]                
  0702  6bdb41           imul bx, bx, 0x41                        
  0705  8ec0             mov es, ax                               
  0707  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  070c  98               cwde                                     
  070d  ba042c           mov dx, 0x2c04                           
  0710  8ec2             mov es, dx                               
  0712  268b1e1001       mov bx, word ptr es:[0x110]              
  0717  c1e303           shl bx, 3                                
  071a  03d8             add bx, ax                               
  071c  b8042c           mov ax, 0x2c04                           
  071f  8ec0             mov es, ax                               
  0721  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0726  250300           and ax, 3                                
  0729  3d0200           cmp ax, 2                                
  072c  7403             je 0x731                                 
  072e  e99b00           jmp 0x7cc                                
  0731  8b5efe           mov bx, word ptr [bp - 2]                
  0734  6bdb41           imul bx, bx, 0x41                        
  0737  b8042c           mov ax, 0x2c04                           
  073a  8ec0             mov es, ax                               
  073c  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0741  8b5efe           mov bx, word ptr [bp - 2]                
  0744  6bdb41           imul bx, bx, 0x41                        
  0747  b8042c           mov ax, 0x2c04                           
  074a  8ec0             mov es, ax                               
  074c  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0751  9a6100f72f       lcall 0x2ff7, 0x61                       -> ovl29:15c5
  0756  83c404           add sp, 4                                
  0759  8843de           mov byte ptr [bp + di - 0x22], al        
  075c  b400             mov ah, 0                                
  075e  8bc8             mov cx, ax                               
  0760  0bc9             or cx, cx                                
  0762  7523             jne 0x787                                
  0764  837efc04         cmp word ptr [bp - 4], 4                 
  0768  7d06             jge 0x770                                
  076a  807be419         cmp byte ptr [bp + di - 0x1c], 0x19      
  076e  720c             jb 0x77c                                 
  0770  837efc06         cmp word ptr [bp - 4], 6                 
  0774  7d56             jge 0x7cc                                
  0776  807be40f         cmp byte ptr [bp + di - 0x1c], 0xf       
  077a  7350             jae 0x7cc                                
  077c  c746f20100       mov word ptr [bp - 0xe], 1               
  0781  c643deff         mov byte ptr [bp + di - 0x22], 0xff      
  0785  eb45             jmp 0x7cc                                
  0787  3b4ef4           cmp cx, word ptr [bp - 0xc]              
  078a  7c40             jl 0x7cc                                 
  078c  8a43e4           mov al, byte ptr [bp + di - 0x1c]        
  078f  b400             mov ah, 0                                
  0791  50               push ax                                  
  0792  a1005e           mov ax, word ptr [0x5e00]                
  0795  05feff           add ax, 0xfffe                           
  0798  3d0100           cmp ax, 1                                
  079b  7d05             jge 0x7a2                                
  079d  b80100           mov ax, 1                                
  07a0  eb06             jmp 0x7a8                                
  07a2  a1005e           mov ax, word ptr [0x5e00]                
  07a5  05feff           add ax, 0xfffe                           
  07a8  8bd8             mov bx, ax                               
  07aa  58               pop ax                                   
  07ab  99               cdq                                      
  07ac  f7fb             idiv bx                                  
  07ae  40               inc ax                                   
  07af  8bd0             mov dx, ax                               
  07b1  3b56f6           cmp dx, word ptr [bp - 0xa]              
  07b4  7c0a             jl 0x7c0                                 
  07b6  3b56f6           cmp dx, word ptr [bp - 0xa]              
  07b9  7511             jne 0x7cc                                
  07bb  3b4ef8           cmp cx, word ptr [bp - 8]                
  07be  7e0c             jle 0x7cc                                
  07c0  8b46fe           mov ax, word ptr [bp - 2]                
  07c3  8946fa           mov word ptr [bp - 6], ax                
  07c6  894ef8           mov word ptr [bp - 8], cx                
  07c9  8956f6           mov word ptr [bp - 0xa], dx              
  07cc  8bc7             mov ax, di                               
  07ce  4f               dec di                                   
  07cf  0bc0             or ax, ax                                
  07d1  7403             je 0x7d6                                 
  07d3  e97afe           jmp 0x650                                
  07d6  837ef200         cmp word ptr [bp - 0xe], 0               
  07da  7530             jne 0x80c                                
  07dc  837efaff         cmp word ptr [bp - 6], -1                
  07e0  742a             je 0x80c                                 
  07e2  6a00             push 0                                   
  07e4  ff76fa           push word ptr [bp - 6]                   
  07e7  6a01             push 1                                   
  07e9  16               push ss                                  
  07ea  8d46ce           lea ax, [bp - 0x32]                      
  07ed  50               push ax                                  
  07ee  9a2a00f72f       lcall 0x2ff7, 0x2a                       -> ovl29:0ae7
  07f3  83c40a           add sp, 0xa                              
  07f6  6a00             push 0                                   
  07f8  c41e625e         les bx, ptr [0x5e62]                     
  07fc  26ff7714         push word ptr es:[bx + 0x14]             
  0800  26ff7712         push word ptr es:[bx + 0x12]             
  0804  9a01008b0a       lcall 0xa8b, 1                           -> 0a8b:0001
  0809  83c406           add sp, 6                                
  080c  5f               pop di                                   
  080d  5e               pop si                                   
  080e  c9               leave                                    
  080f  cb               retf                                     
