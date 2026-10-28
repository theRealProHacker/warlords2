; ovl32 stub 300b file_off 0x58620 size 0x349

ovl32_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec50           sub sp, 0x50                             
  0006  c70624410000     mov word ptr [0x4124], 0                 
  000c  a19a0e           mov ax, word ptr [0xe9a]                 
  000f  a32241           mov word ptr [0x4122], ax                
  0012  a19c0e           mov ax, word ptr [0xe9c]                 
  0015  a32041           mov word ptr [0x4120], ax                
  0018  a1980e           mov ax, word ptr [0xe98]                 
  001b  6bc041           imul ax, ax, 0x41                        
  001e  058115           add ax, 0x1581                           
  0021  68042c           push 0x2c04                              
  0024  50               push ax                                  
  0025  1e               push ds                                  
  0026  686c0a           push 0xa6c                                ; "raze %s?"
  0029  16               push ss                                  
  002a  8d46b0           lea ax, [bp - 0x50]                      
  002d  50               push ax                                  
  002e  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0033  83c40c           add sp, 0xc                              
  0036  680b30           push 0x300b                              
  0039  682a00           push 0x2a                                
  003c  680b30           push 0x300b                              
  003f  682500           push 0x25                                
  0042  1e               push ds                                  
  0043  689d0a           push 0xa9d                                ; "You won't be popular!"
  0046  16               push ss                                  
  0047  8d46b0           lea ax, [bp - 0x50]                      
  004a  50               push ax                                  
  004b  1e               push ds                                  
  004c  68950a           push 0xa95                                ; "want to"
  004f  1e               push ds                                  
  0050  687f0a           push 0xa7f                                ; "Are you sure that you"
  0053  1e               push ds                                  
  0054  68750a           push 0xa75                                ; "Raze City"
  0057  9a2500a530       lcall 0x30a5, 0x25                       -> ovl56:0088
  005c  83c41c           add sp, 0x1c                             
  005f  c9               leave                                    
  0060  cb               retf                                     

ovl32_0061:  ; ENTRY
  0061  55               push bp                                  
  0062  8bec             mov bp, sp                               
  0064  666a19           push 0x19                                
  0067  6a01             push 1                                   
  0069  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  006e  83c406           add sp, 6                                
  0071  051900           add ax, 0x19                             
  0074  ba042c           mov dx, 0x2c04                           
  0077  8ec2             mov es, dx                               
  0079  268b1e1001       mov bx, word ptr es:[0x110]              
  007e  d1e3             shl bx, 1                                
  0080  ba042c           mov dx, 0x2c04                           
  0083  8ec2             mov es, dx                               
  0085  260187e310       add word ptr es:[bx + 0x10e3], ax        
  008a  6a0a             push 0xa                                 
  008c  ff362041         push word ptr [0x4120]                   
  0090  ff362241         push word ptr [0x4122]                   
  0094  90               nop                                      
  0095  0e               push cs                                  
  0096  e86500           call 0xfe                                
  0099  83c406           add sp, 6                                
  009c  9a2a00e830       lcall 0x30e8, 0x2a                       -> ovl62:03f9
  00a1  9a2f00e830       lcall 0x30e8, 0x2f                       -> ovl62:02bf
  00a6  9a3400e830       lcall 0x30e8, 0x34                       -> ovl62:0372
  00ab  833e244100       cmp word ptr [0x4124], 0                 
  00b0  740d             je 0xbf                                  
  00b2  666a00           push 0                                   
  00b5  9a2000d730       lcall 0x30d7, 0x20                       -> ovl61:0000
  00ba  83c404           add sp, 4                                
  00bd  eb12             jmp 0xd1                                 
  00bf  ff369c0e         push word ptr [0xe9c]                    
  00c3  ff369a0e         push word ptr [0xe9a]                    
  00c7  6a00             push 0                                   
  00c9  9a20006430       lcall 0x3064, 0x20                       -> ovl45:0000
  00ce  83c406           add sp, 6                                
  00d1  5d               pop bp                                   
  00d2  cb               retf                                     

ovl32_00d3:  ; ENTRY
  00d3  55               push bp                                  
  00d4  8bec             mov bp, sp                               
  00d6  833e244100       cmp word ptr [0x4124], 0                 
  00db  740d             je 0xea                                  
  00dd  666a00           push 0                                   
  00e0  9a2000d730       lcall 0x30d7, 0x20                       -> ovl61:0000
  00e5  83c404           add sp, 4                                
  00e8  eb12             jmp 0xfc                                 
  00ea  ff369c0e         push word ptr [0xe9c]                    
  00ee  ff369a0e         push word ptr [0xe9a]                    
  00f2  6a01             push 1                                   
  00f4  9a20006430       lcall 0x3064, 0x20                       -> ovl45:0000
  00f9  83c406           add sp, 6                                
  00fc  5d               pop bp                                   
  00fd  cb               retf                                     

ovl32_00fe:  ; ENTRY
  00fe  55               push bp                                  
  00ff  8bec             mov bp, sp                               
  0101  83ec34           sub sp, 0x34                             
  0104  6a01             push 1                                   
  0106  ff7608           push word ptr [bp + 8]                   
  0109  ff7606           push word ptr [bp + 6]                   
  010c  90               nop                                      
  010d  0e               push cs                                  
  010e  e85a00           call 0x16b                               
  0111  83c406           add sp, 6                                
  0114  8946fe           mov word ptr [bp - 2], ax                
  0117  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  011c  666a00           push 0                                   
  011f  666801000100     push 0x10001                             
  0125  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  012a  83c408           add sp, 8                                
  012d  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0132  833e244100       cmp word ptr [0x4124], 0                 
  0137  7430             je 0x169                                 
  0139  8b46fe           mov ax, word ptr [bp - 2]                
  013c  6bc041           imul ax, ax, 0x41                        
  013f  058115           add ax, 0x1581                           
  0142  68042c           push 0x2c04                              
  0145  50               push ax                                  
  0146  1e               push ds                                  
  0147  68b30a           push 0xab3                                ; "%s is in ruins!"
  014a  16               push ss                                  
  014b  8d46cc           lea ax, [bp - 0x34]                      
  014e  50               push ax                                  
  014f  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0154  83c40c           add sp, 0xc                              
  0157  16               push ss                                  
  0158  8d46cc           lea ax, [bp - 0x34]                      
  015b  50               push ax                                  
  015c  9a8900d730       lcall 0x30d7, 0x89                       -> ovl61:10fb
  0161  83c404           add sp, 4                                
  0164  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  0169  c9               leave                                    
  016a  cb               retf                                     

ovl32_016b:  ; ENTRY
  016b  55               push bp                                  
  016c  8bec             mov bp, sp                               
  016e  83ec02           sub sp, 2                                
  0171  56               push si                                  
  0172  57               push di                                  
  0173  ff7608           push word ptr [bp + 8]                   
  0176  ff7606           push word ptr [bp + 6]                   
  0179  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  017e  83c404           add sp, 4                                
  0181  8bf0             mov si, ax                               
  0183  8bde             mov bx, si                               
  0185  6bdb41           imul bx, bx, 0x41                        
  0188  b8042c           mov ax, 0x2c04                           
  018b  8ec0             mov es, ax                               
  018d  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0192  98               cwde                                     
  0193  d1e0             shl ax, 1                                
  0195  05a000           add ax, 0xa0                             
  0198  8946fe           mov word ptr [bp - 2], ax                
  019b  8bde             mov bx, si                               
  019d  6bdb41           imul bx, bx, 0x41                        
  01a0  b8042c           mov ax, 0x2c04                           
  01a3  8ec0             mov es, ax                               
  01a5  268b8f7d15       mov cx, word ptr es:[bx + 0x157d]        
  01aa  8bde             mov bx, si                               
  01ac  6bdb41           imul bx, bx, 0x41                        
  01af  b8042c           mov ax, 0x2c04                           
  01b2  8ec0             mov es, ax                               
  01b4  268bbf7f15       mov di, word ptr es:[bx + 0x157f]        
  01b9  8bde             mov bx, si                               
  01bb  6bdb41           imul bx, bx, 0x41                        
  01be  b8042c           mov ax, 0x2c04                           
  01c1  8ec0             mov es, ax                               
  01c3  26c68792150f     mov byte ptr es:[bx + 0x1592], 0xf       
  01c9  8bde             mov bx, si                               
  01cb  6bdb41           imul bx, bx, 0x41                        
  01ce  b8042c           mov ax, 0x2c04                           
  01d1  8ec0             mov es, ax                               
  01d3  26c687ac150f     mov byte ptr es:[bx + 0x15ac], 0xf       
  01d9  8b46fe           mov ax, word ptr [bp - 2]                
  01dc  25ff00           and ax, 0xff                             
  01df  8bdf             mov bx, di                               
  01e1  69dbe000         imul bx, bx, 0xe0                        
  01e5  8bd1             mov dx, cx                               
  01e7  d1e2             shl dx, 1                                
  01e9  03da             add bx, dx                               
  01eb  ba1d1e           mov dx, 0x1e1d                           
  01ee  8ec2             mov es, dx                               
  01f0  2680a7000000     and byte ptr es:[bx], 0                  
  01f6  2608870000       or byte ptr es:[bx], al                  
  01fb  8b46fe           mov ax, word ptr [bp - 2]                
  01fe  051000           add ax, 0x10                             
  0201  25ff00           and ax, 0xff                             
  0204  8bdf             mov bx, di                               
  0206  69dbe000         imul bx, bx, 0xe0                        
  020a  8bd1             mov dx, cx                               
  020c  d1e2             shl dx, 1                                
  020e  03da             add bx, dx                               
  0210  ba1d1e           mov dx, 0x1e1d                           
  0213  8ec2             mov es, dx                               
  0215  2680a7e00000     and byte ptr es:[bx + 0xe0], 0           
  021b  260887e000       or byte ptr es:[bx + 0xe0], al           
  0220  8b46fe           mov ax, word ptr [bp - 2]                
  0223  40               inc ax                                   
  0224  25ff00           and ax, 0xff                             
  0227  8bdf             mov bx, di                               
  0229  69dbe000         imul bx, bx, 0xe0                        
  022d  8bd1             mov dx, cx                               
  022f  d1e2             shl dx, 1                                
  0231  03da             add bx, dx                               
  0233  ba1d1e           mov dx, 0x1e1d                           
  0236  8ec2             mov es, dx                               
  0238  2680a7020000     and byte ptr es:[bx + 2], 0              
  023e  2608870200       or byte ptr es:[bx + 2], al              
  0243  8b46fe           mov ax, word ptr [bp - 2]                
  0246  051100           add ax, 0x11                             
  0249  25ff00           and ax, 0xff                             
  024c  8bdf             mov bx, di                               
  024e  69dbe000         imul bx, bx, 0xe0                        
  0252  8bd1             mov dx, cx                               
  0254  d1e2             shl dx, 1                                
  0256  03da             add bx, dx                               
  0258  ba1d1e           mov dx, 0x1e1d                           
  025b  8ec2             mov es, dx                               
  025d  2680a7e20000     and byte ptr es:[bx + 0xe2], 0           
  0263  260887e200       or byte ptr es:[bx + 0xe2], al           
  0268  8bde             mov bx, si                               
  026a  6bdb41           imul bx, bx, 0x41                        
  026d  b8042c           mov ax, 0x2c04                           
  0270  8ec0             mov es, ax                               
  0272  2683bfae1500     cmp word ptr es:[bx + 0x15ae], 0         
  0278  740e             je 0x288                                 
  027a  8bde             mov bx, si                               
  027c  6bdb41           imul bx, bx, 0x41                        
  027f  8ec0             mov es, ax                               
  0281  26c787ae150000   mov word ptr es:[bx + 0x15ae], 0         
  0288  33c9             xor cx, cx                               
  028a  e9a700           jmp 0x334                                
  028d  8bd9             mov bx, cx                               
  028f  6bdb41           imul bx, bx, 0x41                        
  0292  b8042c           mov ax, 0x2c04                           
  0295  8ec0             mov es, ax                               
  0297  2683bfae1500     cmp word ptr es:[bx + 0x15ae], 0         
  029d  7503             jne 0x2a2                                
  029f  e99100           jmp 0x333                                
  02a2  8bd9             mov bx, cx                               
  02a4  6bdb41           imul bx, bx, 0x41                        
  02a7  b8042c           mov ax, 0x2c04                           
  02aa  8ec0             mov es, ax                               
  02ac  268b87b015       mov ax, word ptr es:[bx + 0x15b0]        
  02b1  8bde             mov bx, si                               
  02b3  6bdb41           imul bx, bx, 0x41                        
  02b6  ba042c           mov dx, 0x2c04                           
  02b9  8ec2             mov es, dx                               
  02bb  263b877d15       cmp ax, word ptr es:[bx + 0x157d]        
  02c0  7571             jne 0x333                                
  02c2  8bd9             mov bx, cx                               
  02c4  6bdb41           imul bx, bx, 0x41                        
  02c7  b8042c           mov ax, 0x2c04                           
  02ca  8ec0             mov es, ax                               
  02cc  268b87b215       mov ax, word ptr es:[bx + 0x15b2]        
  02d1  8bde             mov bx, si                               
  02d3  6bdb41           imul bx, bx, 0x41                        
  02d6  ba042c           mov dx, 0x2c04                           
  02d9  8ec2             mov es, dx                               
  02db  263b877f15       cmp ax, word ptr es:[bx + 0x157f]        
  02e0  7551             jne 0x333                                
  02e2  8bd9             mov bx, cx                               
  02e4  6bdb41           imul bx, bx, 0x41                        
  02e7  b8042c           mov ax, 0x2c04                           
  02ea  b200             mov dl, 0                                
  02ec  8ec0             mov es, ax                               
  02ee  268897aa15       mov byte ptr es:[bx + 0x15aa], dl        
  02f3  8ac2             mov al, dl                               
  02f5  98               cwde                                     
  02f6  8bd9             mov bx, cx                               
  02f8  6bdb41           imul bx, bx, 0x41                        
  02fb  ba042c           mov dx, 0x2c04                           
  02fe  8ec2             mov es, dx                               
  0300  268987b215       mov word ptr es:[bx + 0x15b2], ax        
  0305  8bd9             mov bx, cx                               
  0307  6bdb41           imul bx, bx, 0x41                        
  030a  ba042c           mov dx, 0x2c04                           
  030d  8ec2             mov es, dx                               
  030f  268987b015       mov word ptr es:[bx + 0x15b0], ax        
  0314  8bd9             mov bx, cx                               
  0316  6bdb41           imul bx, bx, 0x41                        
  0319  ba042c           mov dx, 0x2c04                           
  031c  8ec2             mov es, dx                               
  031e  268987ae15       mov word ptr es:[bx + 0x15ae], ax        
  0323  8bd9             mov bx, cx                               
  0325  6bdb41           imul bx, bx, 0x41                        
  0328  b8042c           mov ax, 0x2c04                           
  032b  8ec0             mov es, ax                               
  032d  26c687a915ff     mov byte ptr es:[bx + 0x15a9], 0xff      
  0333  41               inc cx                                   
  0334  b8042c           mov ax, 0x2c04                           
  0337  8ec0             mov es, ax                               
  0339  26390e7b15       cmp word ptr es:[0x157b], cx             
  033e  7e03             jle 0x343                                
  0340  e94aff           jmp 0x28d                                
  0343  8bc6             mov ax, si                               
  0345  5f               pop di                                   
  0346  5e               pop si                                   
  0347  c9               leave                                    
  0348  cb               retf                                     
