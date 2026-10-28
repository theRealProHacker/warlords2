; ovl09 stub 2f83 file_off 0x42700 size 0x1416

ovl09_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  90               nop                                      
  0004  0e               push cs                                  
  0005  e85400           call 0x5c                                
  0008  90               nop                                      
  0009  0e               push cs                                  
  000a  e85704           call 0x464                               
  000d  90               nop                                      
  000e  0e               push cs                                  
  000f  e85204           call 0x464                               
  0012  5d               pop bp                                   
  0013  cb               retf                                     

ovl09_0014:  ; ENTRY
  0014  55               push bp                                  
  0015  8bec             mov bp, sp                               
  0017  90               nop                                      
  0018  0e               push cs                                  
  0019  e82f0a           call 0xa4b                               
  001c  6a5c             push 0x5c                                
  001e  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  0023  59               pop cx                                   
  0024  9a25008d2f       lcall 0x2f8d, 0x25                       -> ovl11:05e3
  0029  9a20008a2f       lcall 0x2f8a, 0x20                       -> ovl10:0000
  002e  6a5e             push 0x5e                                
  0030  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  0035  59               pop cx                                   
  0036  9a39008d2f       lcall 0x2f8d, 0x39                       -> ovl11:0ce0
  003b  6a60             push 0x60                                
  003d  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  0042  59               pop cx                                   
  0043  90               nop                                      
  0044  0e               push cs                                  
  0045  e8f510           call 0x113d                              
  0048  6a62             push 0x62                                
  004a  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  004f  59               pop cx                                   
  0050  90               nop                                      
  0051  0e               push cs                                  
  0052  e82702           call 0x27c                               
  0055  90               nop                                      
  0056  0e               push cs                                  
  0057  e87510           call 0x10cf                              
  005a  5d               pop bp                                   
  005b  cb               retf                                     

ovl09_005c:  ; ENTRY
  005c  55               push bp                                  
  005d  8bec             mov bp, sp                               
  005f  56               push si                                  
  0060  57               push di                                  
  0061  33f6             xor si, si                               
  0063  e9b901           jmp 0x21f                                
  0066  33c9             xor cx, cx                               
  0068  e9ab01           jmp 0x216                                
  006b  8bc1             mov ax, cx                               
  006d  03c6             add ax, si                               
  006f  741d             je 0x8e                                  
  0071  8bc1             mov ax, cx                               
  0073  03c6             add ax, si                               
  0075  99               cdq                                      
  0076  2bc2             sub ax, dx                               
  0078  d1f8             sar ax, 1                                
  007a  50               push ax                                  
  007b  8bc1             mov ax, cx                               
  007d  03c6             add ax, si                               
  007f  48               dec ax                                   
  0080  99               cdq                                      
  0081  2bc2             sub ax, dx                               
  0083  d1f8             sar ax, 1                                
  0085  5a               pop dx                                   
  0086  3bd0             cmp dx, ax                               
  0088  7504             jne 0x8e                                 
  008a  33c0             xor ax, ax                               
  008c  eb03             jmp 0x91                                 
  008e  b80100           mov ax, 1                                
  0091  8bd0             mov dx, ax                               
  0093  8bc6             mov ax, si                               
  0095  6bc070           imul ax, ax, 0x70                        
  0098  c41e8a3f         les bx, ptr [0x3f8a]                     
  009c  03d8             add bx, ax                               
  009e  03d9             add bx, cx                               
  00a0  2680bf20610a     cmp byte ptr es:[bx + 0x6120], 0xa       
  00a6  7403             je 0xab                                  
  00a8  e9e900           jmp 0x194                                
  00ab  8bc6             mov ax, si                               
  00ad  48               dec ax                                   
  00ae  6bc070           imul ax, ax, 0x70                        
  00b1  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  00b5  03d8             add bx, ax                               
  00b7  03d9             add bx, cx                               
  00b9  2680bf20610a     cmp byte ptr es:[bx + 0x6120], 0xa       
  00bf  7503             jne 0xc4                                 
  00c1  e9d000           jmp 0x194                                
  00c4  8bc6             mov ax, si                               
  00c6  6bc070           imul ax, ax, 0x70                        
  00c9  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  00cd  03d8             add bx, ax                               
  00cf  03d9             add bx, cx                               
  00d1  2680bf1f610a     cmp byte ptr es:[bx + 0x611f], 0xa       
  00d7  7503             jne 0xdc                                 
  00d9  e9b800           jmp 0x194                                
  00dc  0bc9             or cx, cx                                
  00de  7f03             jg 0xe3                                  
  00e0  e9b100           jmp 0x194                                
  00e3  0bf6             or si, si                                
  00e5  7f03             jg 0xea                                  
  00e7  e9aa00           jmp 0x194                                
  00ea  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  00ee  268b87e406       mov ax, word ptr es:[bx + 0x6e4]         
  00f3  25ff00           and ax, 0xff                             
  00f6  8bde             mov bx, si                               
  00f8  69dbe000         imul bx, bx, 0xe0                        
  00fc  8bd1             mov dx, cx                               
  00fe  d1e2             shl dx, 1                                
  0100  03da             add bx, dx                               
  0102  ba1d1e           mov dx, 0x1e1d                           
  0105  8ec2             mov es, dx                               
  0107  2680a7000000     and byte ptr es:[bx], 0                  
  010d  2608870000       or byte ptr es:[bx], al                  
  0112  c41e8a3f         les bx, ptr [0x3f8a]                     
  0116  268b87e406       mov ax, word ptr es:[bx + 0x6e4]         
  011b  40               inc ax                                   
  011c  25ff00           and ax, 0xff                             
  011f  8bde             mov bx, si                               
  0121  69dbe000         imul bx, bx, 0xe0                        
  0125  8bd1             mov dx, cx                               
  0127  d1e2             shl dx, 1                                
  0129  03da             add bx, dx                               
  012b  ba1d1e           mov dx, 0x1e1d                           
  012e  8ec2             mov es, dx                               
  0130  2680a7020000     and byte ptr es:[bx + 2], 0              
  0136  2608870200       or byte ptr es:[bx + 2], al              
  013b  c41e8a3f         les bx, ptr [0x3f8a]                     
  013f  268b87e406       mov ax, word ptr es:[bx + 0x6e4]         
  0144  051000           add ax, 0x10                             
  0147  25ff00           and ax, 0xff                             
  014a  8bde             mov bx, si                               
  014c  69dbe000         imul bx, bx, 0xe0                        
  0150  8bd1             mov dx, cx                               
  0152  d1e2             shl dx, 1                                
  0154  03da             add bx, dx                               
  0156  ba1d1e           mov dx, 0x1e1d                           
  0159  8ec2             mov es, dx                               
  015b  2680a7e00000     and byte ptr es:[bx + 0xe0], 0           
  0161  260887e000       or byte ptr es:[bx + 0xe0], al           
  0166  c41e8a3f         les bx, ptr [0x3f8a]                     
  016a  268b87e406       mov ax, word ptr es:[bx + 0x6e4]         
  016f  051100           add ax, 0x11                             
  0172  25ff00           and ax, 0xff                             
  0175  8bde             mov bx, si                               
  0177  69dbe000         imul bx, bx, 0xe0                        
  017b  8bd1             mov dx, cx                               
  017d  d1e2             shl dx, 1                                
  017f  03da             add bx, dx                               
  0181  ba1d1e           mov dx, 0x1e1d                           
  0184  8ec2             mov es, dx                               
  0186  2680a7e20000     and byte ptr es:[bx + 0xe2], 0           
  018c  260887e200       or byte ptr es:[bx + 0xe2], al           
  0191  e98100           jmp 0x215                                
  0194  8bc6             mov ax, si                               
  0196  6bc070           imul ax, ax, 0x70                        
  0199  c41e8a3f         les bx, ptr [0x3f8a]                     
  019d  03d8             add bx, ax                               
  019f  03d9             add bx, cx                               
  01a1  2680bf20610b     cmp byte ptr es:[bx + 0x6120], 0xb       
  01a7  7511             jne 0x1ba                                
  01a9  8bc2             mov ax, dx                               
  01ab  d1e0             shl ax, 1                                
  01ad  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  01b1  03d8             add bx, ax                               
  01b3  268b872407       mov ax, word ptr es:[bx + 0x724]         
  01b8  eb3c             jmp 0x1f6                                
  01ba  8bc6             mov ax, si                               
  01bc  6bc070           imul ax, ax, 0x70                        
  01bf  c41e8a3f         les bx, ptr [0x3f8a]                     
  01c3  03d8             add bx, ax                               
  01c5  03d9             add bx, cx                               
  01c7  2680bf20610a     cmp byte ptr es:[bx + 0x6120], 0xa       
  01cd  7446             je 0x215                                 
  01cf  8bc6             mov ax, si                               
  01d1  6bc070           imul ax, ax, 0x70                        
  01d4  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  01d8  03d8             add bx, ax                               
  01da  03d9             add bx, cx                               
  01dc  268a872061       mov al, byte ptr es:[bx + 0x6120]        
  01e1  98               cwde                                     
  01e2  c1e006           shl ax, 6                                
  01e5  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  01e9  03d8             add bx, ax                               
  01eb  8bc2             mov ax, dx                               
  01ed  d1e0             shl ax, 1                                
  01ef  03d8             add bx, ax                               
  01f1  268b876404       mov ax, word ptr es:[bx + 0x464]         
  01f6  25ff00           and ax, 0xff                             
  01f9  8bde             mov bx, si                               
  01fb  69dbe000         imul bx, bx, 0xe0                        
  01ff  8bd1             mov dx, cx                               
  0201  d1e2             shl dx, 1                                
  0203  03da             add bx, dx                               
  0205  ba1d1e           mov dx, 0x1e1d                           
  0208  8ec2             mov es, dx                               
  020a  2680a7000000     and byte ptr es:[bx], 0                  
  0210  2608870000       or byte ptr es:[bx], al                  
  0215  41               inc cx                                   
  0216  83f970           cmp cx, 0x70                             
  0219  7d03             jge 0x21e                                
  021b  e94dfe           jmp 0x6b                                 
  021e  46               inc si                                   
  021f  81fe9c00         cmp si, 0x9c                             
  0223  7d03             jge 0x228                                
  0225  e93efe           jmp 0x66                                 
  0228  33ff             xor di, di                               
  022a  eb47             jmp 0x273                                
  022c  8bdf             mov bx, di                               
  022e  6bdb1f           imul bx, bx, 0x1f                        
  0231  b8042c           mov ax, 0x2c04                           
  0234  8ec0             mov es, ax                               
  0236  268b8f1108       mov cx, word ptr es:[bx + 0x811]         
  023b  8bdf             mov bx, di                               
  023d  6bdb1f           imul bx, bx, 0x1f                        
  0240  b8042c           mov ax, 0x2c04                           
  0243  8ec0             mov es, ax                               
  0245  268bb71308       mov si, word ptr es:[bx + 0x813]         
  024a  c41e8a3f         les bx, ptr [0x3f8a]                     
  024e  268b872807       mov ax, word ptr es:[bx + 0x728]         
  0253  25ff00           and ax, 0xff                             
  0256  8bde             mov bx, si                               
  0258  69dbe000         imul bx, bx, 0xe0                        
  025c  8bd1             mov dx, cx                               
  025e  d1e2             shl dx, 1                                
  0260  03da             add bx, dx                               
  0262  ba1d1e           mov dx, 0x1e1d                           
  0265  8ec2             mov es, dx                               
  0267  2680a7000000     and byte ptr es:[bx], 0                  
  026d  2608870000       or byte ptr es:[bx], al                  
  0272  47               inc di                                   
  0273  83ff08           cmp di, 8                                
  0276  7cb4             jl 0x22c                                 
  0278  5f               pop di                                   
  0279  5e               pop si                                   
  027a  5d               pop bp                                   
  027b  cb               retf                                     

ovl09_027c:  ; ENTRY
  027c  55               push bp                                  
  027d  8bec             mov bp, sp                               
  027f  83ec32           sub sp, 0x32                             
  0282  56               push si                                  
  0283  666a1e           push 0x1e                                
  0286  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  028b  83c404           add sp, 4                                
  028e  52               push dx                                  
  028f  50               push ax                                  
  0290  16               push ss                                  
  0291  8d46ce           lea ax, [bp - 0x32]                      
  0294  50               push ax                                  
  0295  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  029a  83c408           add sp, 8                                
  029d  6a09             push 9                                   
  029f  16               push ss                                  
  02a0  8d46ce           lea ax, [bp - 0x32]                      
  02a3  50               push ax                                  
  02a4  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  02a9  83c406           add sp, 6                                
  02ac  8bf0             mov si, ax                               
  02ae  0bf6             or si, si                                
  02b0  7d2a             jge 0x2dc                                
  02b2  16               push ss                                  
  02b3  8d46ce           lea ax, [bp - 0x32]                      
  02b6  50               push ax                                  
  02b7  666a01           push 1                                   
  02ba  9a7500c130       lcall 0x30c1, 0x75                       -> ovl59:051a
  02bf  83c404           add sp, 4                                
  02c2  52               push dx                                  
  02c3  50               push ax                                  
  02c4  1e               push ds                                  
  02c5  68885c           push 0x5c88                              
  02c8  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  02cd  83c40c           add sp, 0xc                              
  02d0  1e               push ds                                  
  02d1  68885c           push 0x5c88                              
  02d4  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  02d9  83c404           add sp, 4                                
  02dc  688088           push 0x8880                              
  02df  681d1e           push 0x1e1d                              
  02e2  680000           push 0                                   
  02e5  56               push si                                  
  02e6  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  02eb  83c408           add sp, 8                                
  02ee  56               push si                                  
  02ef  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  02f4  59               pop cx                                   
  02f5  666a1f           push 0x1f                                
  02f8  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  02fd  83c404           add sp, 4                                
  0300  52               push dx                                  
  0301  50               push ax                                  
  0302  16               push ss                                  
  0303  8d46ce           lea ax, [bp - 0x32]                      
  0306  50               push ax                                  
  0307  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  030c  83c408           add sp, 8                                
  030f  6a09             push 9                                   
  0311  16               push ss                                  
  0312  8d46ce           lea ax, [bp - 0x32]                      
  0315  50               push ax                                  
  0316  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  031b  83c406           add sp, 6                                
  031e  8bf0             mov si, ax                               
  0320  0bf6             or si, si                                
  0322  7d2a             jge 0x34e                                
  0324  16               push ss                                  
  0325  8d46ce           lea ax, [bp - 0x32]                      
  0328  50               push ax                                  
  0329  666a01           push 1                                   
  032c  9a7500c130       lcall 0x30c1, 0x75                       -> ovl59:051a
  0331  83c404           add sp, 4                                
  0334  52               push dx                                  
  0335  50               push ax                                  
  0336  1e               push ds                                  
  0337  68885c           push 0x5c88                              
  033a  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  033f  83c40c           add sp, 0xc                              
  0342  1e               push ds                                  
  0343  68885c           push 0x5c88                              
  0346  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  034b  83c404           add sp, 4                                
  034e  684044           push 0x4440                              
  0351  68d919           push 0x19d9                              
  0354  680000           push 0                                   
  0357  56               push si                                  
  0358  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  035d  83c408           add sp, 8                                
  0360  56               push si                                  
  0361  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0366  59               pop cx                                   
  0367  666a23           push 0x23                                
  036a  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  036f  83c404           add sp, 4                                
  0372  52               push dx                                  
  0373  50               push ax                                  
  0374  16               push ss                                  
  0375  8d46ce           lea ax, [bp - 0x32]                      
  0378  50               push ax                                  
  0379  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  037e  83c408           add sp, 8                                
  0381  6a09             push 9                                   
  0383  16               push ss                                  
  0384  8d46ce           lea ax, [bp - 0x32]                      
  0387  50               push ax                                  
  0388  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  038d  83c406           add sp, 6                                
  0390  8bf0             mov si, ax                               
  0392  0bf6             or si, si                                
  0394  7d2a             jge 0x3c0                                
  0396  16               push ss                                  
  0397  8d46ce           lea ax, [bp - 0x32]                      
  039a  50               push ax                                  
  039b  666a01           push 1                                   
  039e  9a7500c130       lcall 0x30c1, 0x75                       -> ovl59:051a
  03a3  83c404           add sp, 4                                
  03a6  52               push dx                                  
  03a7  50               push ax                                  
  03a8  1e               push ds                                  
  03a9  68885c           push 0x5c88                              
  03ac  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  03b1  83c40c           add sp, 0xc                              
  03b4  1e               push ds                                  
  03b5  68885c           push 0x5c88                              
  03b8  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  03bd  83c404           add sp, 4                                
  03c0  c41e8a3f         les bx, ptr [0x3f8a]                     
  03c4  26ffb76410       push word ptr es:[bx + 0x1064]           
  03c9  a18a3f           mov ax, word ptr [0x3f8a]                
  03cc  05561f           add ax, 0x1f56                           
  03cf  ff368c3f         push word ptr [0x3f8c]                   
  03d3  50               push ax                                  
  03d4  56               push si                                  
  03d5  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  03da  83c408           add sp, 8                                
  03dd  56               push si                                  
  03de  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  03e3  59               pop cx                                   
  03e4  666a22           push 0x22                                
  03e7  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  03ec  83c404           add sp, 4                                
  03ef  52               push dx                                  
  03f0  50               push ax                                  
  03f1  16               push ss                                  
  03f2  8d46ce           lea ax, [bp - 0x32]                      
  03f5  50               push ax                                  
  03f6  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  03fb  83c408           add sp, 8                                
  03fe  6a09             push 9                                   
  0400  16               push ss                                  
  0401  8d46ce           lea ax, [bp - 0x32]                      
  0404  50               push ax                                  
  0405  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  040a  83c406           add sp, 6                                
  040d  8bf0             mov si, ax                               
  040f  0bf6             or si, si                                
  0411  7d2a             jge 0x43d                                
  0413  16               push ss                                  
  0414  8d46ce           lea ax, [bp - 0x32]                      
  0417  50               push ax                                  
  0418  666a01           push 1                                   
  041b  9a7500c130       lcall 0x30c1, 0x75                       -> ovl59:051a
  0420  83c404           add sp, 4                                
  0423  52               push dx                                  
  0424  50               push ax                                  
  0425  1e               push ds                                  
  0426  68885c           push 0x5c88                              
  0429  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  042e  83c40c           add sp, 0xc                              
  0431  1e               push ds                                  
  0432  68885c           push 0x5c88                              
  0435  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  043a  83c404           add sp, 4                                
  043d  c41e8a3f         les bx, ptr [0x3f8a]                     
  0441  26ffb76610       push word ptr es:[bx + 0x1066]           
  0446  a18a3f           mov ax, word ptr [0x3f8a]                
  0449  05963e           add ax, 0x3e96                           
  044c  ff368c3f         push word ptr [0x3f8c]                   
  0450  50               push ax                                  
  0451  56               push si                                  
  0452  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0457  83c408           add sp, 8                                
  045a  56               push si                                  
  045b  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0460  59               pop cx                                   
  0461  5e               pop si                                   
  0462  c9               leave                                    
  0463  cb               retf                                     

ovl09_0464:  ; ENTRY
  0464  55               push bp                                  
  0465  8bec             mov bp, sp                               
  0467  83ec02           sub sp, 2                                
  046a  56               push si                                  
  046b  57               push di                                  
  046c  33ff             xor di, di                               
  046e  e93701           jmp 0x5a8                                
  0471  33f6             xor si, si                               
  0473  e92901           jmp 0x59f                                
  0476  8bc7             mov ax, di                               
  0478  6bc070           imul ax, ax, 0x70                        
  047b  c41e8a3f         les bx, ptr [0x3f8a]                     
  047f  03d8             add bx, ax                               
  0481  03de             add bx, si                               
  0483  2680bf206102     cmp byte ptr es:[bx + 0x6120], 2         
  0489  7418             je 0x4a3                                 
  048b  8bc7             mov ax, di                               
  048d  6bc070           imul ax, ax, 0x70                        
  0490  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0494  03d8             add bx, ax                               
  0496  03de             add bx, si                               
  0498  2680bf206103     cmp byte ptr es:[bx + 0x6120], 3         
  049e  7403             je 0x4a3                                 
  04a0  e9fb00           jmp 0x59e                                
  04a3  57               push di                                  
  04a4  56               push si                                  
  04a5  90               nop                                      
  04a6  0e               push cs                                  
  04a7  e8f307           call 0xc9d                               
  04aa  83c404           add sp, 4                                
  04ad  8bc8             mov cx, ax                               
  04af  8bc6             mov ax, si                               
  04b1  03c7             add ax, di                               
  04b3  741d             je 0x4d2                                 
  04b5  8bc6             mov ax, si                               
  04b7  03c7             add ax, di                               
  04b9  99               cdq                                      
  04ba  2bc2             sub ax, dx                               
  04bc  d1f8             sar ax, 1                                
  04be  50               push ax                                  
  04bf  8bc6             mov ax, si                               
  04c1  03c7             add ax, di                               
  04c3  48               dec ax                                   
  04c4  99               cdq                                      
  04c5  2bc2             sub ax, dx                               
  04c7  d1f8             sar ax, 1                                
  04c9  5a               pop dx                                   
  04ca  3bd0             cmp dx, ax                               
  04cc  7504             jne 0x4d2                                
  04ce  33c0             xor ax, ax                               
  04d0  eb03             jmp 0x4d5                                
  04d2  b80100           mov ax, 1                                
  04d5  8946fe           mov word ptr [bp - 2], ax                
  04d8  c41e8a3f         les bx, ptr [0x3f8a]                     
  04dc  03d9             add bx, cx                               
  04de  2680bf640200     cmp byte ptr es:[bx + 0x264], 0          
  04e4  7d65             jge 0x54b                                
  04e6  8bc7             mov ax, di                               
  04e8  6bc070           imul ax, ax, 0x70                        
  04eb  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  04ef  03d8             add bx, ax                               
  04f1  03de             add bx, si                               
  04f3  26c687206108     mov byte ptr es:[bx + 0x6120], 8         
  04f9  8b46fe           mov ax, word ptr [bp - 2]                
  04fc  d1e0             shl ax, 1                                
  04fe  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0502  03d8             add bx, ax                               
  0504  268b876406       mov ax, word ptr es:[bx + 0x664]         
  0509  25ff00           and ax, 0xff                             
  050c  8bdf             mov bx, di                               
  050e  69dbe000         imul bx, bx, 0xe0                        
  0512  8bd6             mov dx, si                               
  0514  d1e2             shl dx, 1                                
  0516  03da             add bx, dx                               
  0518  ba1d1e           mov dx, 0x1e1d                           
  051b  8ec2             mov es, dx                               
  051d  2680a7000000     and byte ptr es:[bx], 0                  
  0523  2608870000       or byte ptr es:[bx], al                  
  0528  57               push di                                  
  0529  56               push si                                  
  052a  9a2000802f       lcall 0x2f80, 0x20                       -> ovl08:0029
  052f  83c404           add sp, 4                                
  0532  8bdf             mov bx, di                               
  0534  69dbe000         imul bx, bx, 0xe0                        
  0538  8bc6             mov ax, si                               
  053a  d1e0             shl ax, 1                                
  053c  03d8             add bx, ax                               
  053e  b81d1e           mov ax, 0x1e1d                           
  0541  8ec0             mov es, ax                               
  0543  2680a701007f     and byte ptr es:[bx + 1], 0x7f           
  0549  eb53             jmp 0x59e                                
  054b  8bc7             mov ax, di                               
  054d  6bc070           imul ax, ax, 0x70                        
  0550  c41e8a3f         les bx, ptr [0x3f8a]                     
  0554  03d8             add bx, ax                               
  0556  03de             add bx, si                               
  0558  26c687206102     mov byte ptr es:[bx + 0x6120], 2         
  055e  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0562  03d9             add bx, cx                               
  0564  268a876402       mov al, byte ptr es:[bx + 0x264]         
  0569  98               cwde                                     
  056a  c1e002           shl ax, 2                                
  056d  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0571  03d8             add bx, ax                               
  0573  8b46fe           mov ax, word ptr [bp - 2]                
  0576  d1e0             shl ax, 1                                
  0578  03d8             add bx, ax                               
  057a  268b87e404       mov ax, word ptr es:[bx + 0x4e4]         
  057f  25ff00           and ax, 0xff                             
  0582  8bdf             mov bx, di                               
  0584  69dbe000         imul bx, bx, 0xe0                        
  0588  8bd6             mov dx, si                               
  058a  d1e2             shl dx, 1                                
  058c  03da             add bx, dx                               
  058e  ba1d1e           mov dx, 0x1e1d                           
  0591  8ec2             mov es, dx                               
  0593  2680a7000000     and byte ptr es:[bx], 0                  
  0599  2608870000       or byte ptr es:[bx], al                  
  059e  46               inc si                                   
  059f  83fe70           cmp si, 0x70                             
  05a2  7d03             jge 0x5a7                                
  05a4  e9cffe           jmp 0x476                                
  05a7  47               inc di                                   
  05a8  81ff9c00         cmp di, 0x9c                             
  05ac  7d03             jge 0x5b1                                
  05ae  e9c0fe           jmp 0x471                                
  05b1  33ff             xor di, di                               
  05b3  e94801           jmp 0x6fe                                
  05b6  33f6             xor si, si                               
  05b8  e93a01           jmp 0x6f5                                
  05bb  8bc7             mov ax, di                               
  05bd  6bc070           imul ax, ax, 0x70                        
  05c0  c41e8a3f         les bx, ptr [0x3f8a]                     
  05c4  03d8             add bx, ax                               
  05c6  03de             add bx, si                               
  05c8  2680bf206104     cmp byte ptr es:[bx + 0x6120], 4         
  05ce  7403             je 0x5d3                                 
  05d0  e92101           jmp 0x6f4                                
  05d3  57               push di                                  
  05d4  56               push si                                  
  05d5  90               nop                                      
  05d6  0e               push cs                                  
  05d7  e87507           call 0xd4f                               
  05da  83c404           add sp, 4                                
  05dd  8bc8             mov cx, ax                               
  05df  8bc6             mov ax, si                               
  05e1  03c7             add ax, di                               
  05e3  741d             je 0x602                                 
  05e5  8bc6             mov ax, si                               
  05e7  03c7             add ax, di                               
  05e9  99               cdq                                      
  05ea  2bc2             sub ax, dx                               
  05ec  d1f8             sar ax, 1                                
  05ee  50               push ax                                  
  05ef  8bc6             mov ax, si                               
  05f1  03c7             add ax, di                               
  05f3  48               dec ax                                   
  05f4  99               cdq                                      
  05f5  2bc2             sub ax, dx                               
  05f7  d1f8             sar ax, 1                                
  05f9  5a               pop dx                                   
  05fa  3bd0             cmp dx, ax                               
  05fc  7504             jne 0x602                                
  05fe  33c0             xor ax, ax                               
  0600  eb03             jmp 0x605                                
  0602  b80100           mov ax, 1                                
  0605  8946fe           mov word ptr [bp - 2], ax                
  0608  c41e8a3f         les bx, ptr [0x3f8a]                     
  060c  03d9             add bx, cx                               
  060e  2680bf640200     cmp byte ptr es:[bx + 0x264], 0          
  0614  7c03             jl 0x619                                 
  0616  e98800           jmp 0x6a1                                
  0619  666a0a           push 0xa                                 
  061c  6a01             push 1                                   
  061e  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0623  83c406           add sp, 6                                
  0626  3d0500           cmp ax, 5                                
  0629  7f45             jg 0x670                                 
  062b  8b46fe           mov ax, word ptr [bp - 2]                
  062e  d1e0             shl ax, 1                                
  0630  c41e8a3f         les bx, ptr [0x3f8a]                     
  0634  03d8             add bx, ax                               
  0636  268b872406       mov ax, word ptr es:[bx + 0x624]         
  063b  25ff00           and ax, 0xff                             
  063e  8bdf             mov bx, di                               
  0640  69dbe000         imul bx, bx, 0xe0                        
  0644  8bd6             mov dx, si                               
  0646  d1e2             shl dx, 1                                
  0648  03da             add bx, dx                               
  064a  ba1d1e           mov dx, 0x1e1d                           
  064d  8ec2             mov es, dx                               
  064f  2680a7000000     and byte ptr es:[bx], 0                  
  0655  2608870000       or byte ptr es:[bx], al                  
  065a  8bc7             mov ax, di                               
  065c  6bc070           imul ax, ax, 0x70                        
  065f  c41e8a3f         les bx, ptr [0x3f8a]                     
  0663  03d8             add bx, ax                               
  0665  03de             add bx, si                               
  0667  26c687206107     mov byte ptr es:[bx + 0x6120], 7         
  066d  e98400           jmp 0x6f4                                
  0670  8b46fe           mov ax, word ptr [bp - 2]                
  0673  d1e0             shl ax, 1                                
  0675  c41e8a3f         les bx, ptr [0x3f8a]                     
  0679  03d8             add bx, ax                               
  067b  268b879805       mov ax, word ptr es:[bx + 0x598]         
  0680  25ff00           and ax, 0xff                             
  0683  8bdf             mov bx, di                               
  0685  69dbe000         imul bx, bx, 0xe0                        
  0689  8bd6             mov dx, si                               
  068b  d1e2             shl dx, 1                                
  068d  03da             add bx, dx                               
  068f  ba1d1e           mov dx, 0x1e1d                           
  0692  8ec2             mov es, dx                               
  0694  2680a7000000     and byte ptr es:[bx], 0                  
  069a  2608870000       or byte ptr es:[bx], al                  
  069f  eb53             jmp 0x6f4                                
  06a1  c41e8a3f         les bx, ptr [0x3f8a]                     
  06a5  03d9             add bx, cx                               
  06a7  268a876402       mov al, byte ptr es:[bx + 0x264]         
  06ac  98               cwde                                     
  06ad  c1e002           shl ax, 2                                
  06b0  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  06b4  03d8             add bx, ax                               
  06b6  8b46fe           mov ax, word ptr [bp - 2]                
  06b9  d1e0             shl ax, 1                                
  06bb  03d8             add bx, ax                               
  06bd  268b876405       mov ax, word ptr es:[bx + 0x564]         
  06c2  25ff00           and ax, 0xff                             
  06c5  8bdf             mov bx, di                               
  06c7  69dbe000         imul bx, bx, 0xe0                        
  06cb  8bd6             mov dx, si                               
  06cd  d1e2             shl dx, 1                                
  06cf  03da             add bx, dx                               
  06d1  ba1d1e           mov dx, 0x1e1d                           
  06d4  8ec2             mov es, dx                               
  06d6  2680a7000000     and byte ptr es:[bx], 0                  
  06dc  2608870000       or byte ptr es:[bx], al                  
  06e1  8bc7             mov ax, di                               
  06e3  6bc070           imul ax, ax, 0x70                        
  06e6  c41e8a3f         les bx, ptr [0x3f8a]                     
  06ea  03d8             add bx, ax                               
  06ec  03de             add bx, si                               
  06ee  26c687206104     mov byte ptr es:[bx + 0x6120], 4         
  06f4  46               inc si                                   
  06f5  83fe70           cmp si, 0x70                             
  06f8  7d03             jge 0x6fd                                
  06fa  e9befe           jmp 0x5bb                                
  06fd  47               inc di                                   
  06fe  81ff9c00         cmp di, 0x9c                             
  0702  7d03             jge 0x707                                
  0704  e9affe           jmp 0x5b6                                
  0707  33ff             xor di, di                               
  0709  e9fe00           jmp 0x80a                                
  070c  33f6             xor si, si                               
  070e  e9f000           jmp 0x801                                
  0711  8bc7             mov ax, di                               
  0713  6bc070           imul ax, ax, 0x70                        
  0716  c41e8a3f         les bx, ptr [0x3f8a]                     
  071a  03d8             add bx, ax                               
  071c  03de             add bx, si                               
  071e  2680bf206106     cmp byte ptr es:[bx + 0x6120], 6         
  0724  7403             je 0x729                                 
  0726  e9d700           jmp 0x800                                
  0729  57               push di                                  
  072a  56               push si                                  
  072b  90               nop                                      
  072c  0e               push cs                                  
  072d  e89b06           call 0xdcb                               
  0730  83c404           add sp, 4                                
  0733  8bc8             mov cx, ax                               
  0735  8bc6             mov ax, si                               
  0737  03c7             add ax, di                               
  0739  741d             je 0x758                                 
  073b  8bc6             mov ax, si                               
  073d  03c7             add ax, di                               
  073f  99               cdq                                      
  0740  2bc2             sub ax, dx                               
  0742  d1f8             sar ax, 1                                
  0744  50               push ax                                  
  0745  8bc6             mov ax, si                               
  0747  03c7             add ax, di                               
  0749  48               dec ax                                   
  074a  99               cdq                                      
  074b  2bc2             sub ax, dx                               
  074d  d1f8             sar ax, 1                                
  074f  5a               pop dx                                   
  0750  3bd0             cmp dx, ax                               
  0752  7504             jne 0x758                                
  0754  33c0             xor ax, ax                               
  0756  eb03             jmp 0x75b                                
  0758  b80100           mov ax, 1                                
  075b  8946fe           mov word ptr [bp - 2], ax                
  075e  c41e8a3f         les bx, ptr [0x3f8a]                     
  0762  03d9             add bx, cx                               
  0764  2680bf640200     cmp byte ptr es:[bx + 0x264], 0          
  076a  7d41             jge 0x7ad                                
  076c  d1e0             shl ax, 1                                
  076e  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0772  03d8             add bx, ax                               
  0774  268b87a405       mov ax, word ptr es:[bx + 0x5a4]         
  0779  25ff00           and ax, 0xff                             
  077c  8bdf             mov bx, di                               
  077e  69dbe000         imul bx, bx, 0xe0                        
  0782  8bd6             mov dx, si                               
  0784  d1e2             shl dx, 1                                
  0786  03da             add bx, dx                               
  0788  ba1d1e           mov dx, 0x1e1d                           
  078b  8ec2             mov es, dx                               
  078d  2680a7000000     and byte ptr es:[bx], 0                  
  0793  2608870000       or byte ptr es:[bx], al                  
  0798  8bc7             mov ax, di                               
  079a  6bc070           imul ax, ax, 0x70                        
  079d  c41e8a3f         les bx, ptr [0x3f8a]                     
  07a1  03d8             add bx, ax                               
  07a3  03de             add bx, si                               
  07a5  26c687206105     mov byte ptr es:[bx + 0x6120], 5         
  07ab  eb53             jmp 0x800                                
  07ad  c41e8a3f         les bx, ptr [0x3f8a]                     
  07b1  03d9             add bx, cx                               
  07b3  268a876402       mov al, byte ptr es:[bx + 0x264]         
  07b8  98               cwde                                     
  07b9  c1e002           shl ax, 2                                
  07bc  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  07c0  03d8             add bx, ax                               
  07c2  8b46fe           mov ax, word ptr [bp - 2]                
  07c5  d1e0             shl ax, 1                                
  07c7  03d8             add bx, ax                               
  07c9  268b87e405       mov ax, word ptr es:[bx + 0x5e4]         
  07ce  25ff00           and ax, 0xff                             
  07d1  8bdf             mov bx, di                               
  07d3  69dbe000         imul bx, bx, 0xe0                        
  07d7  8bd6             mov dx, si                               
  07d9  d1e2             shl dx, 1                                
  07db  03da             add bx, dx                               
  07dd  ba1d1e           mov dx, 0x1e1d                           
  07e0  8ec2             mov es, dx                               
  07e2  2680a7000000     and byte ptr es:[bx], 0                  
  07e8  2608870000       or byte ptr es:[bx], al                  
  07ed  8bc7             mov ax, di                               
  07ef  6bc070           imul ax, ax, 0x70                        
  07f2  c41e8a3f         les bx, ptr [0x3f8a]                     
  07f6  03d8             add bx, ax                               
  07f8  03de             add bx, si                               
  07fa  26c687206106     mov byte ptr es:[bx + 0x6120], 6         
  0800  46               inc si                                   
  0801  83fe70           cmp si, 0x70                             
  0804  7d03             jge 0x809                                
  0806  e908ff           jmp 0x711                                
  0809  47               inc di                                   
  080a  81ff9c00         cmp di, 0x9c                             
  080e  7d03             jge 0x813                                
  0810  e9f9fe           jmp 0x70c                                
  0813  33ff             xor di, di                               
  0815  e96201           jmp 0x97a                                
  0818  33f6             xor si, si                               
  081a  e95401           jmp 0x971                                
  081d  8bc7             mov ax, di                               
  081f  6bc070           imul ax, ax, 0x70                        
  0822  c41e8a3f         les bx, ptr [0x3f8a]                     
  0826  03d8             add bx, ax                               
  0828  03de             add bx, si                               
  082a  2680bf206105     cmp byte ptr es:[bx + 0x6120], 5         
  0830  7403             je 0x835                                 
  0832  e93b01           jmp 0x970                                
  0835  57               push di                                  
  0836  56               push si                                  
  0837  90               nop                                      
  0838  0e               push cs                                  
  0839  e80b06           call 0xe47                               
  083c  83c404           add sp, 4                                
  083f  8bc8             mov cx, ax                               
  0841  8bc6             mov ax, si                               
  0843  03c7             add ax, di                               
  0845  741d             je 0x864                                 
  0847  8bc6             mov ax, si                               
  0849  03c7             add ax, di                               
  084b  99               cdq                                      
  084c  2bc2             sub ax, dx                               
  084e  d1f8             sar ax, 1                                
  0850  50               push ax                                  
  0851  8bc6             mov ax, si                               
  0853  03c7             add ax, di                               
  0855  48               dec ax                                   
  0856  99               cdq                                      
  0857  2bc2             sub ax, dx                               
  0859  d1f8             sar ax, 1                                
  085b  5a               pop dx                                   
  085c  3bd0             cmp dx, ax                               
  085e  7504             jne 0x864                                
  0860  33c0             xor ax, ax                               
  0862  eb03             jmp 0x867                                
  0864  b80100           mov ax, 1                                
  0867  8946fe           mov word ptr [bp - 2], ax                
  086a  c41e8a3f         les bx, ptr [0x3f8a]                     
  086e  03d9             add bx, cx                               
  0870  2680bf640200     cmp byte ptr es:[bx + 0x264], 0          
  0876  7c03             jl 0x87b                                 
  0878  e9a200           jmp 0x91d                                
  087b  666a0a           push 0xa                                 
  087e  6a01             push 1                                   
  0880  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0885  83c406           add sp, 6                                
  0888  3d0500           cmp ax, 5                                
  088b  7f45             jg 0x8d2                                 
  088d  8b46fe           mov ax, word ptr [bp - 2]                
  0890  d1e0             shl ax, 1                                
  0892  c41e8a3f         les bx, ptr [0x3f8a]                     
  0896  03d8             add bx, ax                               
  0898  268b872406       mov ax, word ptr es:[bx + 0x624]         
  089d  25ff00           and ax, 0xff                             
  08a0  8bdf             mov bx, di                               
  08a2  69dbe000         imul bx, bx, 0xe0                        
  08a6  8bd6             mov dx, si                               
  08a8  d1e2             shl dx, 1                                
  08aa  03da             add bx, dx                               
  08ac  ba1d1e           mov dx, 0x1e1d                           
  08af  8ec2             mov es, dx                               
  08b1  2680a7000000     and byte ptr es:[bx], 0                  
  08b7  2608870000       or byte ptr es:[bx], al                  
  08bc  8bc7             mov ax, di                               
  08be  6bc070           imul ax, ax, 0x70                        
  08c1  c41e8a3f         les bx, ptr [0x3f8a]                     
  08c5  03d8             add bx, ax                               
  08c7  03de             add bx, si                               
  08c9  26c687206107     mov byte ptr es:[bx + 0x6120], 7         
  08cf  e99e00           jmp 0x970                                
  08d2  8bc7             mov ax, di                               
  08d4  6bc070           imul ax, ax, 0x70                        
  08d7  c41e8a3f         les bx, ptr [0x3f8a]                     
  08db  03d8             add bx, ax                               
  08dd  03de             add bx, si                               
  08df  b005             mov al, 5                                
  08e1  2688872061       mov byte ptr es:[bx + 0x6120], al        
  08e6  98               cwde                                     
  08e7  c1e006           shl ax, 6                                
  08ea  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  08ee  03d8             add bx, ax                               
  08f0  8b46fe           mov ax, word ptr [bp - 2]                
  08f3  d1e0             shl ax, 1                                
  08f5  03d8             add bx, ax                               
  08f7  268b879804       mov ax, word ptr es:[bx + 0x498]         
  08fc  25ff00           and ax, 0xff                             
  08ff  8bdf             mov bx, di                               
  0901  69dbe000         imul bx, bx, 0xe0                        
  0905  8bd6             mov dx, si                               
  0907  d1e2             shl dx, 1                                
  0909  03da             add bx, dx                               
  090b  ba1d1e           mov dx, 0x1e1d                           
  090e  8ec2             mov es, dx                               
  0910  2680a7000000     and byte ptr es:[bx], 0                  
  0916  2608870000       or byte ptr es:[bx], al                  
  091b  eb53             jmp 0x970                                
  091d  c41e8a3f         les bx, ptr [0x3f8a]                     
  0921  03d9             add bx, cx                               
  0923  268a876402       mov al, byte ptr es:[bx + 0x264]         
  0928  98               cwde                                     
  0929  c1e002           shl ax, 2                                
  092c  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0930  03d8             add bx, ax                               
  0932  8b46fe           mov ax, word ptr [bp - 2]                
  0935  d1e0             shl ax, 1                                
  0937  03d8             add bx, ax                               
  0939  268b87a405       mov ax, word ptr es:[bx + 0x5a4]         
  093e  25ff00           and ax, 0xff                             
  0941  8bdf             mov bx, di                               
  0943  69dbe000         imul bx, bx, 0xe0                        
  0947  8bd6             mov dx, si                               
  0949  d1e2             shl dx, 1                                
  094b  03da             add bx, dx                               
  094d  ba1d1e           mov dx, 0x1e1d                           
  0950  8ec2             mov es, dx                               
  0952  2680a7000000     and byte ptr es:[bx], 0                  
  0958  2608870000       or byte ptr es:[bx], al                  
  095d  8bc7             mov ax, di                               
  095f  6bc070           imul ax, ax, 0x70                        
  0962  c41e8a3f         les bx, ptr [0x3f8a]                     
  0966  03d8             add bx, ax                               
  0968  03de             add bx, si                               
  096a  26c687206105     mov byte ptr es:[bx + 0x6120], 5         
  0970  46               inc si                                   
  0971  83fe70           cmp si, 0x70                             
  0974  7d03             jge 0x979                                
  0976  e9a4fe           jmp 0x81d                                
  0979  47               inc di                                   
  097a  81ff9c00         cmp di, 0x9c                             
  097e  7d03             jge 0x983                                
  0980  e995fe           jmp 0x818                                
  0983  33ff             xor di, di                               
  0985  e9b600           jmp 0xa3e                                
  0988  33f6             xor si, si                               
  098a  e9a800           jmp 0xa35                                
  098d  8bc7             mov ax, di                               
  098f  6bc070           imul ax, ax, 0x70                        
  0992  c41e8a3f         les bx, ptr [0x3f8a]                     
  0996  03d8             add bx, ax                               
  0998  03de             add bx, si                               
  099a  2680bf206108     cmp byte ptr es:[bx + 0x6120], 8         
  09a0  7403             je 0x9a5                                 
  09a2  e98f00           jmp 0xa34                                
  09a5  8bc6             mov ax, si                               
  09a7  03c7             add ax, di                               
  09a9  741d             je 0x9c8                                 
  09ab  8bc6             mov ax, si                               
  09ad  03c7             add ax, di                               
  09af  99               cdq                                      
  09b0  2bc2             sub ax, dx                               
  09b2  d1f8             sar ax, 1                                
  09b4  50               push ax                                  
  09b5  8bc6             mov ax, si                               
  09b7  03c7             add ax, di                               
  09b9  48               dec ax                                   
  09ba  99               cdq                                      
  09bb  2bc2             sub ax, dx                               
  09bd  d1f8             sar ax, 1                                
  09bf  5a               pop dx                                   
  09c0  3bd0             cmp dx, ax                               
  09c2  7504             jne 0x9c8                                
  09c4  33c0             xor ax, ax                               
  09c6  eb03             jmp 0x9cb                                
  09c8  b80100           mov ax, 1                                
  09cb  8946fe           mov word ptr [bp - 2], ax                
  09ce  666a0a           push 0xa                                 
  09d1  6a01             push 1                                   
  09d3  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  09d8  83c406           add sp, 6                                
  09db  3d0600           cmp ax, 6                                
  09de  7f07             jg 0x9e7                                 
  09e0  8b46fe           mov ax, word ptr [bp - 2]                
  09e3  d1e0             shl ax, 1                                
  09e5  eb10             jmp 0x9f7                                
  09e7  666a04           push 4                                   
  09ea  6a01             push 1                                   
  09ec  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  09f1  83c406           add sp, 6                                
  09f4  c1e002           shl ax, 2                                
  09f7  c41e8a3f         les bx, ptr [0x3f8a]                     
  09fb  03d8             add bx, ax                               
  09fd  268b876406       mov ax, word ptr es:[bx + 0x664]         
  0a02  25ff00           and ax, 0xff                             
  0a05  8bdf             mov bx, di                               
  0a07  69dbe000         imul bx, bx, 0xe0                        
  0a0b  8bd6             mov dx, si                               
  0a0d  d1e2             shl dx, 1                                
  0a0f  03da             add bx, dx                               
  0a11  ba1d1e           mov dx, 0x1e1d                           
  0a14  8ec2             mov es, dx                               
  0a16  2680a7000000     and byte ptr es:[bx], 0                  
  0a1c  2608870000       or byte ptr es:[bx], al                  
  0a21  8bc7             mov ax, di                               
  0a23  6bc070           imul ax, ax, 0x70                        
  0a26  c41e8a3f         les bx, ptr [0x3f8a]                     
  0a2a  03d8             add bx, ax                               
  0a2c  03de             add bx, si                               
  0a2e  26c687206108     mov byte ptr es:[bx + 0x6120], 8         
  0a34  46               inc si                                   
  0a35  83fe70           cmp si, 0x70                             
  0a38  7d03             jge 0xa3d                                
  0a3a  e950ff           jmp 0x98d                                
  0a3d  47               inc di                                   
  0a3e  81ff9c00         cmp di, 0x9c                             
  0a42  7d03             jge 0xa47                                
  0a44  e941ff           jmp 0x988                                
  0a47  5f               pop di                                   
  0a48  5e               pop si                                   
  0a49  c9               leave                                    
  0a4a  cb               retf                                     

ovl09_0a4b:  ; ENTRY
  0a4b  55               push bp                                  
  0a4c  8bec             mov bp, sp                               
  0a4e  83ec08           sub sp, 8                                
  0a51  56               push si                                  
  0a52  57               push di                                  
  0a53  33ff             xor di, di                               
  0a55  e91e01           jmp 0xb76                                
  0a58  33f6             xor si, si                               
  0a5a  e91001           jmp 0xb6d                                
  0a5d  8bdf             mov bx, di                               
  0a5f  6bdb70           imul bx, bx, 0x70                        
  0a62  03de             add bx, si                               
  0a64  b8d919           mov ax, 0x19d9                           
  0a67  8ec0             mov es, ax                               
  0a69  268a870000       mov al, byte ptr es:[bx]                 
  0a6e  251f00           and ax, 0x1f                             
  0a71  0bc0             or ax, ax                                
  0a73  7503             jne 0xa78                                
  0a75  e9f400           jmp 0xb6c                                
  0a78  57               push di                                  
  0a79  56               push si                                  
  0a7a  90               nop                                      
  0a7b  0e               push cs                                  
  0a7c  e86404           call 0xee3                               
  0a7f  83c404           add sp, 4                                
  0a82  8bc8             mov cx, ax                               
  0a84  8bc6             mov ax, si                               
  0a86  03c7             add ax, di                               
  0a88  741d             je 0xaa7                                 
  0a8a  8bc6             mov ax, si                               
  0a8c  03c7             add ax, di                               
  0a8e  99               cdq                                      
  0a8f  2bc2             sub ax, dx                               
  0a91  d1f8             sar ax, 1                                
  0a93  50               push ax                                  
  0a94  8bc6             mov ax, si                               
  0a96  03c7             add ax, di                               
  0a98  48               dec ax                                   
  0a99  99               cdq                                      
  0a9a  2bc2             sub ax, dx                               
  0a9c  d1f8             sar ax, 1                                
  0a9e  5a               pop dx                                   
  0a9f  3bd0             cmp dx, ax                               
  0aa1  7504             jne 0xaa7                                
  0aa3  33c0             xor ax, ax                               
  0aa5  eb03             jmp 0xaaa                                
  0aa7  b80100           mov ax, 1                                
  0aaa  8946fe           mov word ptr [bp - 2], ax                
  0aad  c41e8a3f         les bx, ptr [0x3f8a]                     
  0ab1  03d9             add bx, cx                               
  0ab3  2680bf640300     cmp byte ptr es:[bx + 0x364], 0          
  0ab9  7c03             jl 0xabe                                 
  0abb  e98700           jmp 0xb45                                
  0abe  666a0a           push 0xa                                 
  0ac1  6a01             push 1                                   
  0ac3  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0ac8  83c406           add sp, 6                                
  0acb  3d0500           cmp ax, 5                                
  0ace  7f44             jg 0xb14                                 
  0ad0  8b46fe           mov ax, word ptr [bp - 2]                
  0ad3  d1e0             shl ax, 1                                
  0ad5  c41e8a3f         les bx, ptr [0x3f8a]                     
  0ad9  03d8             add bx, ax                               
  0adb  268b872406       mov ax, word ptr es:[bx + 0x624]         
  0ae0  25ff00           and ax, 0xff                             
  0ae3  8bdf             mov bx, di                               
  0ae5  69dbe000         imul bx, bx, 0xe0                        
  0ae9  8bd6             mov dx, si                               
  0aeb  d1e2             shl dx, 1                                
  0aed  03da             add bx, dx                               
  0aef  ba1d1e           mov dx, 0x1e1d                           
  0af2  8ec2             mov es, dx                               
  0af4  2680a7000000     and byte ptr es:[bx], 0                  
  0afa  2608870000       or byte ptr es:[bx], al                  
  0aff  8bc7             mov ax, di                               
  0b01  6bc070           imul ax, ax, 0x70                        
  0b04  c41e8a3f         les bx, ptr [0x3f8a]                     
  0b08  03d8             add bx, ax                               
  0b0a  03de             add bx, si                               
  0b0c  26c687206107     mov byte ptr es:[bx + 0x6120], 7         
  0b12  eb58             jmp 0xb6c                                
  0b14  8b46fe           mov ax, word ptr [bp - 2]                
  0b17  d1e0             shl ax, 1                                
  0b19  c41e8a3f         les bx, ptr [0x3f8a]                     
  0b1d  03d8             add bx, ax                               
  0b1f  268b87d805       mov ax, word ptr es:[bx + 0x5d8]         
  0b24  25ff00           and ax, 0xff                             
  0b27  8bdf             mov bx, di                               
  0b29  69dbe000         imul bx, bx, 0xe0                        
  0b2d  8bd6             mov dx, si                               
  0b2f  d1e2             shl dx, 1                                
  0b31  03da             add bx, dx                               
  0b33  ba1d1e           mov dx, 0x1e1d                           
  0b36  8ec2             mov es, dx                               
  0b38  2680a7000000     and byte ptr es:[bx], 0                  
  0b3e  2608870000       or byte ptr es:[bx], al                  
  0b43  eb27             jmp 0xb6c                                
  0b45  c41e8a3f         les bx, ptr [0x3f8a]                     
  0b49  03d9             add bx, cx                               
  0b4b  268a876403       mov al, byte ptr es:[bx + 0x364]         
  0b50  98               cwde                                     
  0b51  40               inc ax                                   
  0b52  251f00           and ax, 0x1f                             
  0b55  8bdf             mov bx, di                               
  0b57  6bdb70           imul bx, bx, 0x70                        
  0b5a  03de             add bx, si                               
  0b5c  bad919           mov dx, 0x19d9                           
  0b5f  8ec2             mov es, dx                               
  0b61  2680a70000e0     and byte ptr es:[bx], 0xe0               
  0b67  2608870000       or byte ptr es:[bx], al                  
  0b6c  46               inc si                                   
  0b6d  83fe70           cmp si, 0x70                             
  0b70  7d03             jge 0xb75                                
  0b72  e9e8fe           jmp 0xa5d                                
  0b75  47               inc di                                   
  0b76  81ff9c00         cmp di, 0x9c                             
  0b7a  7d03             jge 0xb7f                                
  0b7c  e9d9fe           jmp 0xa58                                
  0b7f  66680a000a00     push 0xa000a                             
  0b85  6a01             push 1                                   
  0b87  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0b8c  83c406           add sp, 6                                
  0b8f  8946fa           mov word ptr [bp - 6], ax                
  0b92  c746fc0000       mov word ptr [bp - 4], 0                 
  0b97  eb6b             jmp 0xc04                                
  0b99  c746f80000       mov word ptr [bp - 8], 0                 
  0b9e  eb5a             jmp 0xbfa                                
  0ba0  66687000ffff     push 0xffff0070                          
  0ba6  6a01             push 1                                   
  0ba8  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0bad  83c406           add sp, 6                                
  0bb0  8bf0             mov si, ax                               
  0bb2  66689c00ffff     push 0xffff009c                          
  0bb8  6a01             push 1                                   
  0bba  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0bbf  83c406           add sp, 6                                
  0bc2  8bf8             mov di, ax                               
  0bc4  8bdf             mov bx, di                               
  0bc6  6bdb70           imul bx, bx, 0x70                        
  0bc9  03de             add bx, si                               
  0bcb  b8d919           mov ax, 0x19d9                           
  0bce  8ec0             mov es, ax                               
  0bd0  268a870000       mov al, byte ptr es:[bx]                 
  0bd5  251f00           and ax, 0x1f                             
  0bd8  3d0200           cmp ax, 2                                
  0bdb  751a             jne 0xbf7                                
  0bdd  8bdf             mov bx, di                               
  0bdf  6bdb70           imul bx, bx, 0x70                        
  0be2  03de             add bx, si                               
  0be4  b8d919           mov ax, 0x19d9                           
  0be7  8ec0             mov es, ax                               
  0be9  2680a70000e0     and byte ptr es:[bx], 0xe0               
  0bef  26808f000011     or byte ptr es:[bx], 0x11                
  0bf5  eb0a             jmp 0xc01                                
  0bf7  ff46f8           inc word ptr [bp - 8]                    
  0bfa  817ef81027       cmp word ptr [bp - 8], 0x2710            
  0bff  7c9f             jl 0xba0                                 
  0c01  ff46fc           inc word ptr [bp - 4]                    
  0c04  8b46fc           mov ax, word ptr [bp - 4]                
  0c07  3b46fa           cmp ax, word ptr [bp - 6]                
  0c0a  7c8d             jl 0xb99                                 
  0c0c  66680a000a00     push 0xa000a                             
  0c12  6a01             push 1                                   
  0c14  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0c19  83c406           add sp, 6                                
  0c1c  8946fa           mov word ptr [bp - 6], ax                
  0c1f  c746fc0000       mov word ptr [bp - 4], 0                 
  0c24  eb6b             jmp 0xc91                                
  0c26  c746f80000       mov word ptr [bp - 8], 0                 
  0c2b  eb5a             jmp 0xc87                                
  0c2d  66687000ffff     push 0xffff0070                          
  0c33  6a01             push 1                                   
  0c35  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0c3a  83c406           add sp, 6                                
  0c3d  8bf0             mov si, ax                               
  0c3f  66689c00ffff     push 0xffff009c                          
  0c45  6a01             push 1                                   
  0c47  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0c4c  83c406           add sp, 6                                
  0c4f  8bf8             mov di, ax                               
  0c51  8bdf             mov bx, di                               
  0c53  6bdb70           imul bx, bx, 0x70                        
  0c56  03de             add bx, si                               
  0c58  b8d919           mov ax, 0x19d9                           
  0c5b  8ec0             mov es, ax                               
  0c5d  268a870000       mov al, byte ptr es:[bx]                 
  0c62  251f00           and ax, 0x1f                             
  0c65  3d0100           cmp ax, 1                                
  0c68  751a             jne 0xc84                                
  0c6a  8bdf             mov bx, di                               
  0c6c  6bdb70           imul bx, bx, 0x70                        
  0c6f  03de             add bx, si                               
  0c71  b8d919           mov ax, 0x19d9                           
  0c74  8ec0             mov es, ax                               
  0c76  2680a70000e0     and byte ptr es:[bx], 0xe0               
  0c7c  26808f000010     or byte ptr es:[bx], 0x10                
  0c82  eb0a             jmp 0xc8e                                
  0c84  ff46f8           inc word ptr [bp - 8]                    
  0c87  817ef81027       cmp word ptr [bp - 8], 0x2710            
  0c8c  7c9f             jl 0xc2d                                 
  0c8e  ff46fc           inc word ptr [bp - 4]                    
  0c91  8b46fc           mov ax, word ptr [bp - 4]                
  0c94  3b46fa           cmp ax, word ptr [bp - 6]                
  0c97  7c8d             jl 0xc26                                 
  0c99  5f               pop di                                   
  0c9a  5e               pop si                                   
  0c9b  c9               leave                                    
  0c9c  cb               retf                                     

ovl09_0c9d:  ; ENTRY
  0c9d  55               push bp                                  
  0c9e  8bec             mov bp, sp                               
  0ca0  83ec02           sub sp, 2                                
  0ca3  56               push si                                  
  0ca4  57               push di                                  
  0ca5  c746fe0000       mov word ptr [bp - 2], 0                 
  0caa  33d2             xor dx, dx                               
  0cac  e99100           jmp 0xd40                                
  0caf  33c9             xor cx, cx                               
  0cb1  8bc2             mov ax, dx                               
  0cb3  c1e002           shl ax, 2                                
  0cb6  c41e8a3f         les bx, ptr [0x3f8a]                     
  0cba  03d8             add bx, ax                               
  0cbc  8b4606           mov ax, word ptr [bp + 6]                
  0cbf  260387bc00       add ax, word ptr es:[bx + 0xbc]          
  0cc4  8bf0             mov si, ax                               
  0cc6  8b4608           mov ax, word ptr [bp + 8]                
  0cc9  260387be00       add ax, word ptr es:[bx + 0xbe]          
  0cce  8bf8             mov di, ax                               
  0cd0  0bf6             or si, si                                
  0cd2  7d03             jge 0xcd7                                
  0cd4  b90100           mov cx, 1                                
  0cd7  0bff             or di, di                                
  0cd9  7d03             jge 0xcde                                
  0cdb  b90100           mov cx, 1                                
  0cde  83fe70           cmp si, 0x70                             
  0ce1  7c03             jl 0xce6                                 
  0ce3  b90100           mov cx, 1                                
  0ce6  81ff9c00         cmp di, 0x9c                             
  0cea  7c03             jl 0xcef                                 
  0cec  b90100           mov cx, 1                                
  0cef  8bc7             mov ax, di                               
  0cf1  6bc070           imul ax, ax, 0x70                        
  0cf4  c41e8a3f         les bx, ptr [0x3f8a]                     
  0cf8  03d8             add bx, ax                               
  0cfa  03de             add bx, si                               
  0cfc  2680bf206102     cmp byte ptr es:[bx + 0x6120], 2         
  0d02  742a             je 0xd2e                                 
  0d04  8bc7             mov ax, di                               
  0d06  6bc070           imul ax, ax, 0x70                        
  0d09  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0d0d  03d8             add bx, ax                               
  0d0f  03de             add bx, si                               
  0d11  2680bf206103     cmp byte ptr es:[bx + 0x6120], 3         
  0d17  7415             je 0xd2e                                 
  0d19  8bc7             mov ax, di                               
  0d1b  6bc070           imul ax, ax, 0x70                        
  0d1e  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0d22  03d8             add bx, ax                               
  0d24  03de             add bx, si                               
  0d26  2680bf206101     cmp byte ptr es:[bx + 0x6120], 1         
  0d2c  7503             jne 0xd31                                
  0d2e  b90100           mov cx, 1                                
  0d31  0bc9             or cx, cx                                
  0d33  740a             je 0xd3f                                 
  0d35  b80100           mov ax, 1                                
  0d38  8aca             mov cl, dl                               
  0d3a  d3e0             shl ax, cl                               
  0d3c  0946fe           or word ptr [bp - 2], ax                 
  0d3f  42               inc dx                                   
  0d40  83fa08           cmp dx, 8                                
  0d43  7d03             jge 0xd48                                
  0d45  e967ff           jmp 0xcaf                                
  0d48  8b46fe           mov ax, word ptr [bp - 2]                
  0d4b  5f               pop di                                   
  0d4c  5e               pop si                                   
  0d4d  c9               leave                                    
  0d4e  cb               retf                                     

ovl09_0d4f:  ; ENTRY
  0d4f  55               push bp                                  
  0d50  8bec             mov bp, sp                               
  0d52  56               push si                                  
  0d53  57               push di                                  
  0d54  33f6             xor si, si                               
  0d56  33d2             xor dx, dx                               
  0d58  eb66             jmp 0xdc0                                
  0d5a  33c9             xor cx, cx                               
  0d5c  8bc2             mov ax, dx                               
  0d5e  c1e002           shl ax, 2                                
  0d61  c41e8a3f         les bx, ptr [0x3f8a]                     
  0d65  03d8             add bx, ax                               
  0d67  8b4606           mov ax, word ptr [bp + 6]                
  0d6a  260387bc00       add ax, word ptr es:[bx + 0xbc]          
  0d6f  8bf8             mov di, ax                               
  0d71  8b4608           mov ax, word ptr [bp + 8]                
  0d74  260387be00       add ax, word ptr es:[bx + 0xbe]          
  0d79  8bd8             mov bx, ax                               
  0d7b  0bff             or di, di                                
  0d7d  7d03             jge 0xd82                                
  0d7f  b90100           mov cx, 1                                
  0d82  0bdb             or bx, bx                                
  0d84  7d03             jge 0xd89                                
  0d86  b90100           mov cx, 1                                
  0d89  83ff70           cmp di, 0x70                             
  0d8c  7c03             jl 0xd91                                 
  0d8e  b90100           mov cx, 1                                
  0d91  81fb9c00         cmp bx, 0x9c                             
  0d95  7c03             jl 0xd9a                                 
  0d97  b90100           mov cx, 1                                
  0d9a  8bc3             mov ax, bx                               
  0d9c  6bc070           imul ax, ax, 0x70                        
  0d9f  c41e8a3f         les bx, ptr [0x3f8a]                     
  0da3  03d8             add bx, ax                               
  0da5  03df             add bx, di                               
  0da7  2680bf206104     cmp byte ptr es:[bx + 0x6120], 4         
  0dad  7503             jne 0xdb2                                
  0daf  b90100           mov cx, 1                                
  0db2  0bc9             or cx, cx                                
  0db4  7409             je 0xdbf                                 
  0db6  b80100           mov ax, 1                                
  0db9  8aca             mov cl, dl                               
  0dbb  d3e0             shl ax, cl                               
  0dbd  0bf0             or si, ax                                
  0dbf  42               inc dx                                   
  0dc0  83fa08           cmp dx, 8                                
  0dc3  7c95             jl 0xd5a                                 
  0dc5  8bc6             mov ax, si                               
  0dc7  5f               pop di                                   
  0dc8  5e               pop si                                   
  0dc9  5d               pop bp                                   
  0dca  cb               retf                                     

ovl09_0dcb:  ; ENTRY
  0dcb  55               push bp                                  
  0dcc  8bec             mov bp, sp                               
  0dce  56               push si                                  
  0dcf  57               push di                                  
  0dd0  33f6             xor si, si                               
  0dd2  33d2             xor dx, dx                               
  0dd4  eb66             jmp 0xe3c                                
  0dd6  33c9             xor cx, cx                               
  0dd8  8bc2             mov ax, dx                               
  0dda  c1e002           shl ax, 2                                
  0ddd  c41e8a3f         les bx, ptr [0x3f8a]                     
  0de1  03d8             add bx, ax                               
  0de3  8b4606           mov ax, word ptr [bp + 6]                
  0de6  260387bc00       add ax, word ptr es:[bx + 0xbc]          
  0deb  8bf8             mov di, ax                               
  0ded  8b4608           mov ax, word ptr [bp + 8]                
  0df0  260387be00       add ax, word ptr es:[bx + 0xbe]          
  0df5  8bd8             mov bx, ax                               
  0df7  0bff             or di, di                                
  0df9  7d03             jge 0xdfe                                
  0dfb  b90100           mov cx, 1                                
  0dfe  0bdb             or bx, bx                                
  0e00  7d03             jge 0xe05                                
  0e02  b90100           mov cx, 1                                
  0e05  83ff70           cmp di, 0x70                             
  0e08  7c03             jl 0xe0d                                 
  0e0a  b90100           mov cx, 1                                
  0e0d  81fb9c00         cmp bx, 0x9c                             
  0e11  7c03             jl 0xe16                                 
  0e13  b90100           mov cx, 1                                
  0e16  8bc3             mov ax, bx                               
  0e18  6bc070           imul ax, ax, 0x70                        
  0e1b  c41e8a3f         les bx, ptr [0x3f8a]                     
  0e1f  03d8             add bx, ax                               
  0e21  03df             add bx, di                               
  0e23  2680bf206106     cmp byte ptr es:[bx + 0x6120], 6         
  0e29  7503             jne 0xe2e                                
  0e2b  b90100           mov cx, 1                                
  0e2e  0bc9             or cx, cx                                
  0e30  7409             je 0xe3b                                 
  0e32  b80100           mov ax, 1                                
  0e35  8aca             mov cl, dl                               
  0e37  d3e0             shl ax, cl                               
  0e39  0bf0             or si, ax                                
  0e3b  42               inc dx                                   
  0e3c  83fa08           cmp dx, 8                                
  0e3f  7c95             jl 0xdd6                                 
  0e41  8bc6             mov ax, si                               
  0e43  5f               pop di                                   
  0e44  5e               pop si                                   
  0e45  5d               pop bp                                   
  0e46  cb               retf                                     

ovl09_0e47:  ; ENTRY
  0e47  55               push bp                                  
  0e48  8bec             mov bp, sp                               
  0e4a  83ec02           sub sp, 2                                
  0e4d  56               push si                                  
  0e4e  57               push di                                  
  0e4f  c746fe0000       mov word ptr [bp - 2], 0                 
  0e54  33d2             xor dx, dx                               
  0e56  eb7c             jmp 0xed4                                
  0e58  33c9             xor cx, cx                               
  0e5a  8bc2             mov ax, dx                               
  0e5c  c1e002           shl ax, 2                                
  0e5f  c41e8a3f         les bx, ptr [0x3f8a]                     
  0e63  03d8             add bx, ax                               
  0e65  8b4606           mov ax, word ptr [bp + 6]                
  0e68  260387bc00       add ax, word ptr es:[bx + 0xbc]          
  0e6d  8bf0             mov si, ax                               
  0e6f  8b4608           mov ax, word ptr [bp + 8]                
  0e72  260387be00       add ax, word ptr es:[bx + 0xbe]          
  0e77  8bf8             mov di, ax                               
  0e79  0bf6             or si, si                                
  0e7b  7d03             jge 0xe80                                
  0e7d  b90100           mov cx, 1                                
  0e80  0bff             or di, di                                
  0e82  7d03             jge 0xe87                                
  0e84  b90100           mov cx, 1                                
  0e87  83fe70           cmp si, 0x70                             
  0e8a  7c03             jl 0xe8f                                 
  0e8c  b90100           mov cx, 1                                
  0e8f  81ff9c00         cmp di, 0x9c                             
  0e93  7c03             jl 0xe98                                 
  0e95  b90100           mov cx, 1                                
  0e98  8bc7             mov ax, di                               
  0e9a  6bc070           imul ax, ax, 0x70                        
  0e9d  c41e8a3f         les bx, ptr [0x3f8a]                     
  0ea1  03d8             add bx, ax                               
  0ea3  03de             add bx, si                               
  0ea5  2680bf206106     cmp byte ptr es:[bx + 0x6120], 6         
  0eab  7415             je 0xec2                                 
  0ead  8bc7             mov ax, di                               
  0eaf  6bc070           imul ax, ax, 0x70                        
  0eb2  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0eb6  03d8             add bx, ax                               
  0eb8  03de             add bx, si                               
  0eba  2680bf206105     cmp byte ptr es:[bx + 0x6120], 5         
  0ec0  7503             jne 0xec5                                
  0ec2  b90100           mov cx, 1                                
  0ec5  0bc9             or cx, cx                                
  0ec7  740a             je 0xed3                                 
  0ec9  b80100           mov ax, 1                                
  0ecc  8aca             mov cl, dl                               
  0ece  d3e0             shl ax, cl                               
  0ed0  0946fe           or word ptr [bp - 2], ax                 
  0ed3  42               inc dx                                   
  0ed4  83fa08           cmp dx, 8                                
  0ed7  7d03             jge 0xedc                                
  0ed9  e97cff           jmp 0xe58                                
  0edc  8b46fe           mov ax, word ptr [bp - 2]                
  0edf  5f               pop di                                   
  0ee0  5e               pop si                                   
  0ee1  c9               leave                                    
  0ee2  cb               retf                                     

ovl09_0ee3:  ; ENTRY
  0ee3  55               push bp                                  
  0ee4  8bec             mov bp, sp                               
  0ee6  56               push si                                  
  0ee7  57               push di                                  
  0ee8  33ff             xor di, di                               
  0eea  33d2             xor dx, dx                               
  0eec  eb79             jmp 0xf67                                
  0eee  8bc2             mov ax, dx                               
  0ef0  c1e002           shl ax, 2                                
  0ef3  c41e8a3f         les bx, ptr [0x3f8a]                     
  0ef7  03d8             add bx, ax                               
  0ef9  8b4e06           mov cx, word ptr [bp + 6]                
  0efc  26038fdc00       add cx, word ptr es:[bx + 0xdc]          
  0f01  8b4608           mov ax, word ptr [bp + 8]                
  0f04  260387de00       add ax, word ptr es:[bx + 0xde]          
  0f09  8bf0             mov si, ax                               
  0f0b  0bc9             or cx, cx                                
  0f0d  7c57             jl 0xf66                                 
  0f0f  0bf6             or si, si                                
  0f11  7c53             jl 0xf66                                 
  0f13  83f970           cmp cx, 0x70                             
  0f16  7d4e             jge 0xf66                                
  0f18  81fe9c00         cmp si, 0x9c                             
  0f1c  7d48             jge 0xf66                                
  0f1e  8bde             mov bx, si                               
  0f20  6bdb70           imul bx, bx, 0x70                        
  0f23  03d9             add bx, cx                               
  0f25  b8d919           mov ax, 0x19d9                           
  0f28  8ec0             mov es, ax                               
  0f2a  268a870000       mov al, byte ptr es:[bx]                 
  0f2f  251f00           and ax, 0x1f                             
  0f32  0bc0             or ax, ax                                
  0f34  7527             jne 0xf5d                                
  0f36  8bde             mov bx, si                               
  0f38  69dbe000         imul bx, bx, 0xe0                        
  0f3c  8bc1             mov ax, cx                               
  0f3e  d1e0             shl ax, 1                                
  0f40  03d8             add bx, ax                               
  0f42  b81d1e           mov ax, 0x1e1d                           
  0f45  8ec0             mov es, ax                               
  0f47  268a9f0000       mov bl, byte ptr es:[bx]                 
  0f4c  81e3ff00         and bx, 0xff                             
  0f50  b8042c           mov ax, 0x2c04                           
  0f53  8ec0             mov es, ax                               
  0f55  2680bf100701     cmp byte ptr es:[bx + 0x710], 1          
  0f5b  7509             jne 0xf66                                
  0f5d  b80100           mov ax, 1                                
  0f60  8aca             mov cl, dl                               
  0f62  d3e0             shl ax, cl                               
  0f64  0bf8             or di, ax                                
  0f66  42               inc dx                                   
  0f67  83fa08           cmp dx, 8                                
  0f6a  7c82             jl 0xeee                                 
  0f6c  8bc7             mov ax, di                               
  0f6e  5f               pop di                                   
  0f6f  5e               pop si                                   
  0f70  5d               pop bp                                   
  0f71  cb               retf                                     

ovl09_0f72:  ; ENTRY
  0f72  55               push bp                                  
  0f73  8bec             mov bp, sp                               
  0f75  ff7608           push word ptr [bp + 8]                   
  0f78  ff7606           push word ptr [bp + 6]                   
  0f7b  0e               push cs                                  
  0f7c  e81efd           call 0xc9d                               
  0f7f  83c404           add sp, 4                                
  0f82  8bd0             mov dx, ax                               
  0f84  c41e8a3f         les bx, ptr [0x3f8a]                     
  0f88  03da             add bx, dx                               
  0f8a  268a876402       mov al, byte ptr es:[bx + 0x264]         
  0f8f  98               cwde                                     
  0f90  c1e002           shl ax, 2                                
  0f93  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0f97  03d8             add bx, ax                               
  0f99  2683bfe40424     cmp word ptr es:[bx + 0x4e4], 0x24       
  0f9f  7457             je 0xff8                                 
  0fa1  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0fa5  03da             add bx, dx                               
  0fa7  268a876402       mov al, byte ptr es:[bx + 0x264]         
  0fac  98               cwde                                     
  0fad  c1e002           shl ax, 2                                
  0fb0  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0fb4  03d8             add bx, ax                               
  0fb6  2683bfe40420     cmp word ptr es:[bx + 0x4e4], 0x20       
  0fbc  743a             je 0xff8                                 
  0fbe  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0fc2  03da             add bx, dx                               
  0fc4  268a876402       mov al, byte ptr es:[bx + 0x264]         
  0fc9  98               cwde                                     
  0fca  c1e002           shl ax, 2                                
  0fcd  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0fd1  03d8             add bx, ax                               
  0fd3  2683bfe40426     cmp word ptr es:[bx + 0x4e4], 0x26       
  0fd9  741d             je 0xff8                                 
  0fdb  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0fdf  03da             add bx, dx                               
  0fe1  268a876402       mov al, byte ptr es:[bx + 0x264]         
  0fe6  98               cwde                                     
  0fe7  c1e002           shl ax, 2                                
  0fea  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0fee  03d8             add bx, ax                               
  0ff0  2683bfe40428     cmp word ptr es:[bx + 0x4e4], 0x28       
  0ff6  7505             jne 0xffd                                
  0ff8  b80100           mov ax, 1                                
  0ffb  eb02             jmp 0xfff                                
  0ffd  33c0             xor ax, ax                               
  0fff  5d               pop bp                                   
  1000  cb               retf                                     

ovl09_1001:  ; ENTRY
  1001  55               push bp                                  
  1002  8bec             mov bp, sp                               
  1004  81eca400         sub sp, 0xa4                             
  1008  56               push si                                  
  1009  57               push di                                  
  100a  33f6             xor si, si                               
  100c  1e               push ds                                  
  100d  68b202           push 0x2b2                                ; "Erythea"
  1010  16               push ss                                  
  1011  8d46b0           lea ax, [bp - 0x50]                      
  1014  50               push ax                                  
  1015  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  101a  83c408           add sp, 8                                
  101d  33ff             xor di, di                               
  101f  eb38             jmp 0x1059                               
  1021  16               push ss                                  
  1022  8d865cff         lea ax, [bp - 0xa4]                      
  1026  50               push ax                                  
  1027  57               push di                                  
  1028  9a8900cc30       lcall 0x30cc, 0x89                       -> ovl60:06c8
  102d  83c406           add sp, 6                                
  1030  0bc0             or ax, ax                                
  1032  7505             jne 0x1039                               
  1034  be0100           mov si, 1                                
  1037  eb20             jmp 0x1059                               
  1039  47               inc di                                   
  103a  8b46ae           mov ax, word ptr [bp - 0x52]             
  103d  3b06ca28         cmp ax, word ptr [0x28ca]                
  1041  7516             jne 0x1059                               
  1043  be0100           mov si, 1                                
  1046  16               push ss                                  
  1047  8d8670ff         lea ax, [bp - 0x90]                      
  104b  50               push ax                                  
  104c  16               push ss                                  
  104d  8d46b0           lea ax, [bp - 0x50]                      
  1050  50               push ax                                  
  1051  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  1056  83c408           add sp, 8                                
  1059  0bf6             or si, si                                
  105b  7507             jne 0x1064                               
  105d  833eca2800       cmp word ptr [0x28ca], 0                 
  1062  75bd             jne 0x1021                               
  1064  16               push ss                                  
  1065  8d46b0           lea ax, [bp - 0x50]                      
  1068  50               push ax                                  
  1069  16               push ss                                  
  106a  50               push ax                                  
  106b  1e               push ds                                  
  106c  68ba02           push 0x2ba                                ; "%s\%s.scn"
  106f  16               push ss                                  
  1070  8d46d8           lea ax, [bp - 0x28]                      
  1073  50               push ax                                  
  1074  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1079  83c410           add sp, 0x10                             
  107c  6a02             push 2                                   
  107e  16               push ss                                  
  107f  8d46d8           lea ax, [bp - 0x28]                      
  1082  50               push ax                                  
  1083  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  1088  83c406           add sp, 6                                
  108b  8bf0             mov si, ax                               
  108d  0bf6             or si, si                                
  108f  7d1e             jge 0x10af                               
  1091  16               push ss                                  
  1092  8d46d8           lea ax, [bp - 0x28]                      
  1095  50               push ax                                  
  1096  666a00           push 0                                   
  1099  9a7500c130       lcall 0x30c1, 0x75                       -> ovl59:051a
  109e  83c404           add sp, 4                                
  10a1  52               push dx                                  
  10a2  50               push ax                                  
  10a3  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  10a8  83c408           add sp, 8                                
  10ab  33c0             xor ax, ax                               
  10ad  eb1c             jmp 0x10cb                               
  10af  68e12e           push 0x2ee1                              
  10b2  68042c           push 0x2c04                              
  10b5  680000           push 0                                   
  10b8  56               push si                                  
  10b9  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  10be  83c408           add sp, 8                                
  10c1  56               push si                                  
  10c2  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  10c7  59               pop cx                                   
  10c8  b80100           mov ax, 1                                
  10cb  5f               pop di                                   
  10cc  5e               pop si                                   
  10cd  c9               leave                                    
  10ce  cb               retf                                     

ovl09_10cf:  ; ENTRY
  10cf  55               push bp                                  
  10d0  8bec             mov bp, sp                               
  10d2  83ec28           sub sp, 0x28                             
  10d5  56               push si                                  
  10d6  666a20           push 0x20                                
  10d9  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  10de  83c404           add sp, 4                                
  10e1  52               push dx                                  
  10e2  50               push ax                                  
  10e3  16               push ss                                  
  10e4  8d46d8           lea ax, [bp - 0x28]                      
  10e7  50               push ax                                  
  10e8  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  10ed  83c408           add sp, 8                                
  10f0  6a09             push 9                                   
  10f2  16               push ss                                  
  10f3  8d46d8           lea ax, [bp - 0x28]                      
  10f6  50               push ax                                  
  10f7  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  10fc  83c406           add sp, 6                                
  10ff  8bf0             mov si, ax                               
  1101  0bf6             or si, si                                
  1103  7d1c             jge 0x1121                               
  1105  16               push ss                                  
  1106  8d46d8           lea ax, [bp - 0x28]                      
  1109  50               push ax                                  
  110a  666a00           push 0                                   
  110d  9a7500c130       lcall 0x30c1, 0x75                       -> ovl59:051a
  1112  83c404           add sp, 4                                
  1115  52               push dx                                  
  1116  50               push ax                                  
  1117  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  111c  83c408           add sp, 8                                
  111f  eb19             jmp 0x113a                               
  1121  68e12e           push 0x2ee1                              
  1124  68042c           push 0x2c04                              
  1127  680000           push 0                                   
  112a  56               push si                                  
  112b  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  1130  83c408           add sp, 8                                
  1133  56               push si                                  
  1134  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  1139  59               pop cx                                   
  113a  5e               pop si                                   
  113b  c9               leave                                    
  113c  cb               retf                                     

ovl09_113d:  ; ENTRY
  113d  55               push bp                                  
  113e  8bec             mov bp, sp                               
  1140  83ec1a           sub sp, 0x1a                             
  1143  56               push si                                  
  1144  57               push di                                  
  1145  c746ee0000       mov word ptr [bp - 0x12], 0              
  114a  66681e002800     push 0x28001e                            
  1150  6a01             push 1                                   
  1152  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1157  83c406           add sp, 6                                
  115a  8946f6           mov word ptr [bp - 0xa], ax              
  115d  6bc068           imul ax, ax, 0x68                        
  1160  050200           add ax, 2                                
  1163  50               push ax                                  
  1164  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  1169  59               pop cx                                   
  116a  8956fe           mov word ptr [bp - 2], dx                
  116d  8946fc           mov word ptr [bp - 4], ax                
  1170  8b46fe           mov ax, word ptr [bp - 2]                
  1173  8b56fc           mov dx, word ptr [bp - 4]                
  1176  83c202           add dx, 2                                
  1179  8946fa           mov word ptr [bp - 6], ax                
  117c  8956f8           mov word ptr [bp - 8], dx                
  117f  668b46fc         mov eax, dword ptr [bp - 4]              
  1183  668946f2         mov dword ptr [bp - 0xe], eax            
  1187  c45ef2           les bx, ptr [bp - 0xe]                   
  118a  8b46f6           mov ax, word ptr [bp - 0xa]              
  118d  268907           mov word ptr es:[bx], ax                 
  1190  33f6             xor si, si                               
  1192  e92b02           jmp 0x13c0                               
  1195  c746ec0000       mov word ptr [bp - 0x14], 0              
  119a  66687000ffff     push 0xffff0070                          
  11a0  6a01             push 1                                   
  11a2  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  11a7  83c406           add sp, 6                                
  11aa  8bf8             mov di, ax                               
  11ac  66689c00ffff     push 0xffff009c                          
  11b2  6a01             push 1                                   
  11b4  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  11b9  83c406           add sp, 6                                
  11bc  8946f0           mov word ptr [bp - 0x10], ax             
  11bf  8b5ef0           mov bx, word ptr [bp - 0x10]             
  11c2  69dbe000         imul bx, bx, 0xe0                        
  11c6  8bc7             mov ax, di                               
  11c8  d1e0             shl ax, 1                                
  11ca  03d8             add bx, ax                               
  11cc  b81d1e           mov ax, 0x1e1d                           
  11cf  8ec0             mov es, ax                               
  11d1  268a9f0000       mov bl, byte ptr es:[bx]                 
  11d6  81e3ff00         and bx, 0xff                             
  11da  b8042c           mov ax, 0x2c04                           
  11dd  8ec0             mov es, ax                               
  11df  2680bf100707     cmp byte ptr es:[bx + 0x710], 7          
  11e5  7542             jne 0x1229                               
  11e7  6a0a             push 0xa                                 
  11e9  ff76f0           push word ptr [bp - 0x10]                
  11ec  57               push di                                  
  11ed  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  11f2  83c406           add sp, 6                                
  11f5  0bc0             or ax, ax                                
  11f7  7530             jne 0x1229                               
  11f9  6a09             push 9                                   
  11fb  ff76f0           push word ptr [bp - 0x10]                
  11fe  57               push di                                  
  11ff  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  1204  83c406           add sp, 6                                
  1207  0bc0             or ax, ax                                
  1209  751e             jne 0x1229                               
  120b  8b5ef0           mov bx, word ptr [bp - 0x10]             
  120e  6bdb70           imul bx, bx, 0x70                        
  1211  03df             add bx, di                               
  1213  b8d919           mov ax, 0x19d9                           
  1216  8ec0             mov es, ax                               
  1218  268a870000       mov al, byte ptr es:[bx]                 
  121d  251f00           and ax, 0x1f                             
  1220  0bc0             or ax, ax                                
  1222  7505             jne 0x1229                               
  1224  c746ec0100       mov word ptr [bp - 0x14], 1              
  1229  837eec00         cmp word ptr [bp - 0x14], 0              
  122d  7503             jne 0x1232                               
  122f  e968ff           jmp 0x119a                               
  1232  8b5ef0           mov bx, word ptr [bp - 0x10]             
  1235  69dbe000         imul bx, bx, 0xe0                        
  1239  8bc7             mov ax, di                               
  123b  d1e0             shl ax, 1                                
  123d  03d8             add bx, ax                               
  123f  b81d1e           mov ax, 0x1e1d                           
  1242  8ec0             mov es, ax                               
  1244  2680a7000000     and byte ptr es:[bx], 0                  
  124a  8bc6             mov ax, si                               
  124c  6bc068           imul ax, ax, 0x68                        
  124f  c45ef8           les bx, ptr [bp - 8]                     
  1252  03d8             add bx, ax                               
  1254  26893f           mov word ptr es:[bx], di                 
  1257  8bc6             mov ax, si                               
  1259  6bc068           imul ax, ax, 0x68                        
  125c  8b5ef8           mov bx, word ptr [bp - 8]                
  125f  03d8             add bx, ax                               
  1261  8b46f0           mov ax, word ptr [bp - 0x10]             
  1264  26894702         mov word ptr es:[bx + 2], ax             
  1268  666a0a           push 0xa                                 
  126b  6a01             push 1                                   
  126d  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1272  83c406           add sp, 6                                
  1275  3d0300           cmp ax, 3                                
  1278  7f70             jg 0x12ea                                
  127a  c41e8a3f         les bx, ptr [0x3f8a]                     
  127e  268b87b018       mov ax, word ptr es:[bx + 0x18b0]        
  1283  3b46ee           cmp ax, word ptr [bp - 0x12]             
  1286  7e62             jle 0x12ea                               
  1288  8b46ee           mov ax, word ptr [bp - 0x12]             
  128b  6bc03c           imul ax, ax, 0x3c                        
  128e  8b168a3f         mov dx, word ptr [0x3f8a]                
  1292  03d0             add dx, ax                               
  1294  81c2b218         add dx, 0x18b2                           
  1298  ff368c3f         push word ptr [0x3f8c]                   
  129c  52               push dx                                  
  129d  8bc6             mov ax, si                               
  129f  6bc068           imul ax, ax, 0x68                        
  12a2  8b56f8           mov dx, word ptr [bp - 8]                
  12a5  03d0             add dx, ax                               
  12a7  83c204           add dx, 4                                
  12aa  ff76fa           push word ptr [bp - 6]                   
  12ad  52               push dx                                  
  12ae  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  12b3  83c408           add sp, 8                                
  12b6  8b46ee           mov ax, word ptr [bp - 0x12]             
  12b9  6bc03c           imul ax, ax, 0x3c                        
  12bc  8b168a3f         mov dx, word ptr [0x3f8a]                
  12c0  03d0             add dx, ax                               
  12c2  81c2d018         add dx, 0x18d0                           
  12c6  ff368c3f         push word ptr [0x3f8c]                   
  12ca  52               push dx                                  
  12cb  8bc6             mov ax, si                               
  12cd  6bc068           imul ax, ax, 0x68                        
  12d0  8b56f8           mov dx, word ptr [bp - 8]                
  12d3  03d0             add dx, ax                               
  12d5  83c236           add dx, 0x36                             
  12d8  ff76fa           push word ptr [bp - 6]                   
  12db  52               push dx                                  
  12dc  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  12e1  83c408           add sp, 8                                
  12e4  ff46ee           inc word ptr [bp - 0x12]                 
  12e7  e9d500           jmp 0x13bf                               
  12ea  666a0e           push 0xe                                 
  12ed  ff76f0           push word ptr [bp - 0x10]                
  12f0  57               push di                                  
  12f1  9a5c00e830       lcall 0x30e8, 0x5c                       -> ovl62:04fa
  12f6  83c408           add sp, 8                                
  12f9  8946ea           mov word ptr [bp - 0x16], ax             
  12fc  8b5eea           mov bx, word ptr [bp - 0x16]             
  12ff  6bdb41           imul bx, bx, 0x41                        
  1302  b8042c           mov ax, 0x2c04                           
  1305  8ec0             mov es, ax                               
  1307  26ffb77f15       push word ptr es:[bx + 0x157f]           
  130c  8b5eea           mov bx, word ptr [bp - 0x16]             
  130f  6bdb41           imul bx, bx, 0x41                        
  1312  b8042c           mov ax, 0x2c04                           
  1315  8ec0             mov es, ax                               
  1317  26ffb77d15       push word ptr es:[bx + 0x157d]           
  131c  ff76f0           push word ptr [bp - 0x10]                
  131f  57               push di                                  
  1320  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  1325  83c408           add sp, 8                                
  1328  d1e0             shl ax, 1                                
  132a  8946e8           mov word ptr [bp - 0x18], ax             
  132d  8b5eea           mov bx, word ptr [bp - 0x16]             
  1330  6bdb41           imul bx, bx, 0x41                        
  1333  b8042c           mov ax, 0x2c04                           
  1336  8ec0             mov es, ax                               
  1338  26ffb77f15       push word ptr es:[bx + 0x157f]           
  133d  8b5eea           mov bx, word ptr [bp - 0x16]             
  1340  6bdb41           imul bx, bx, 0x41                        
  1343  b8042c           mov ax, 0x2c04                           
  1346  8ec0             mov es, ax                               
  1348  26ffb77d15       push word ptr es:[bx + 0x157d]           
  134d  ff76f0           push word ptr [bp - 0x10]                
  1350  57               push di                                  
  1351  9a2000e830       lcall 0x30e8, 0x20                       -> ovl62:0b51
  1356  83c408           add sp, 8                                
  1359  8946e6           mov word ptr [bp - 0x1a], ax             
  135c  8b46ea           mov ax, word ptr [bp - 0x16]             
  135f  6bc041           imul ax, ax, 0x41                        
  1362  058115           add ax, 0x1581                           
  1365  68042c           push 0x2c04                              
  1368  50               push ax                                  
  1369  a18a3f           mov ax, word ptr [0x3f8a]                
  136c  058818           add ax, 0x1888                           
  136f  ff368c3f         push word ptr [0x3f8c]                   
  1373  50               push ax                                  
  1374  8bc6             mov ax, si                               
  1376  6bc068           imul ax, ax, 0x68                        
  1379  8b56f8           mov dx, word ptr [bp - 8]                
  137c  03d0             add dx, ax                               
  137e  83c204           add dx, 4                                
  1381  ff76fa           push word ptr [bp - 6]                   
  1384  52               push dx                                  
  1385  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  138a  83c40c           add sp, 0xc                              
  138d  8b5ee6           mov bx, word ptr [bp - 0x1a]             
  1390  c1e302           shl bx, 2                                
  1393  66ffb77c2b       push dword ptr [bx + 0x2b7c]             
  1398  ff76e8           push word ptr [bp - 0x18]                
  139b  a18a3f           mov ax, word ptr [0x3f8a]                
  139e  059c18           add ax, 0x189c                           
  13a1  ff368c3f         push word ptr [0x3f8c]                   
  13a5  50               push ax                                  
  13a6  8bc6             mov ax, si                               
  13a8  6bc068           imul ax, ax, 0x68                        
  13ab  8b56f8           mov dx, word ptr [bp - 8]                
  13ae  03d0             add dx, ax                               
  13b0  83c236           add dx, 0x36                             
  13b3  ff76fa           push word ptr [bp - 6]                   
  13b6  52               push dx                                  
  13b7  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  13bc  83c40e           add sp, 0xe                              
  13bf  46               inc si                                   
  13c0  3b76f6           cmp si, word ptr [bp - 0xa]              
  13c3  7d03             jge 0x13c8                               
  13c5  e9cdfd           jmp 0x1195                               
  13c8  666800000900     push 0x90000                             
  13ce  6a21             push 0x21                                
  13d0  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  13d5  83c404           add sp, 4                                
  13d8  52               push dx                                  
  13d9  50               push ax                                  
  13da  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  13df  83c406           add sp, 6                                
  13e2  8bf0             mov si, ax                               
  13e4  0bf6             or si, si                                
  13e6  7c1e             jl 0x1406                                
  13e8  8b46f6           mov ax, word ptr [bp - 0xa]              
  13eb  6bc068           imul ax, ax, 0x68                        
  13ee  050200           add ax, 2                                
  13f1  50               push ax                                  
  13f2  66ff76fc         push dword ptr [bp - 4]                  
  13f6  56               push si                                  
  13f7  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  13fc  83c408           add sp, 8                                
  13ff  56               push si                                  
  1400  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  1405  59               pop cx                                   
  1406  66ff76fc         push dword ptr [bp - 4]                  
  140a  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  140f  83c404           add sp, 4                                
  1412  5f               pop di                                   
  1413  5e               pop si                                   
  1414  c9               leave                                    
  1415  cb               retf                                     
