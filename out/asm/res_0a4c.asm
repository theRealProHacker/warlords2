; res_0a4c file_off 0xc4c0

res_0a4c_000b:  ; ENTRY
  000b  55               push bp                                  
  000c  8bec             mov bp, sp                               
  000e  83ec0a           sub sp, 0xa                              
  0011  56               push si                                  
  0012  57               push di                                  
  0013  33f6             xor si, si                               
  0015  c746fe0000       mov word ptr [bp - 2], 0                 
  001a  c746fc0000       mov word ptr [bp - 4], 0                 
  001f  c70686324c0a     mov word ptr [0x3286], 0xa4c             
  0025  c70684328803     mov word ptr [0x3284], 0x388             
  002b  9a0000a30e       lcall 0xea3, 0                           -> 0ea3:0000
  0030  3dffff           cmp ax, 0xffff                           
  0033  7514             jne 0x49                                 
  0035  1e               push ds                                  
  0036  68ce26           push 0x26ce                               ; "Sorry, not enough memory to load game."
  0039  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  003e  83c404           add sp, 4                                
  0041  6a01             push 1                                   
  0043  9ac71c0000       lcall 0, 0x1cc7                          -> 0000:1cc7
  0048  59               pop cx                                   
  0049  9a51022a05       lcall 0x52a, 0x251                       -> 052a:0251
  004e  c70684330100     mov word ptr [0x3384], 1                 
  0054  c7068c330000     mov word ptr [0x338c], 0                 
  005a  837e0601         cmp word ptr [bp + 6], 1                 
  005e  7f03             jg 0x63                                  
  0060  e90601           jmp 0x169                                
  0063  bf0100           mov di, 1                                
  0066  e9f800           jmp 0x161                                
  0069  8bc7             mov ax, di                               
  006b  c1e002           shl ax, 2                                
  006e  c45e08           les bx, ptr [bp + 8]                     
  0071  03d8             add bx, ax                               
  0073  268b4702         mov ax, word ptr es:[bx + 2]             
  0077  268b17           mov dx, word ptr es:[bx]                 
  007a  8946f8           mov word ptr [bp - 8], ax                
  007d  8956f6           mov word ptr [bp - 0xa], dx              
  0080  eb03             jmp 0x85                                 
  0082  ff46f6           inc word ptr [bp - 0xa]                  
  0085  c45ef6           les bx, ptr [bp - 0xa]                   
  0088  26803f2d         cmp byte ptr es:[bx], 0x2d               
  008c  74f4             je 0x82                                  
  008e  26803f2f         cmp byte ptr es:[bx], 0x2f               
  0092  74ee             je 0x82                                  
  0094  268a07           mov al, byte ptr es:[bx]                 
  0097  98               cwde                                     
  0098  50               push ax                                  
  0099  9a8d280000       lcall 0, 0x288d                          -> 0000:288d
  009e  59               pop cx                                   
  009f  8946fa           mov word ptr [bp - 6], ax                
  00a2  b91000           mov cx, 0x10                             
  00a5  bb7502           mov bx, 0x275                            
  00a8  2e8b07           mov ax, word ptr cs:[bx]                 
  00ab  3b46fa           cmp ax, word ptr [bp - 6]                
  00ae  7407             je 0xb7                                  
  00b0  83c302           add bx, 2                                
  00b3  e2f3             loop 0xa8                                
  00b5  eb59             jmp 0x110                                
  00b7  2eff6720         jmp word ptr cs:[bx + 0x20]              
  00bb  e9a200           jmp 0x160                                
  00be  c746fc0100       mov word ptr [bp - 4], 1                 
  00c3  e99a00           jmp 0x160                                
  00c6  c746fe0100       mov word ptr [bp - 2], 1                 
  00cb  e99200           jmp 0x160                                
  00ce  c45ef6           les bx, ptr [bp - 0xa]                   
  00d1  268a07           mov al, byte ptr es:[bx]                 
  00d4  98               cwde                                     
  00d5  05d0ff           add ax, 0xffd0                           
  00d8  6bc00a           imul ax, ax, 0xa                         
  00db  8bf0             mov si, ax                               
  00dd  0bf6             or si, si                                
  00df  7503             jne 0xe4                                 
  00e1  be6400           mov si, 0x64                             
  00e4  56               push si                                  
  00e5  1e               push ds                                  
  00e6  68f626           push 0x26f6                               ; "lockDown %dk"
  00e9  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  00ee  83c406           add sp, 6                                
  00f1  9a08370000       lcall 0, 0x3708                          -> 0000:3708
  00f6  eb68             jmp 0x160                                
  00f8  c706c4260100     mov word ptr [0x26c4], 1                 
  00fe  eb60             jmp 0x160                                
  0100  c706c6260100     mov word ptr [0x26c6], 1                 
  0106  eb58             jmp 0x160                                
  0108  c706c8260100     mov word ptr [0x26c8], 1                 
  010e  eb50             jmp 0x160                                
  0110  1e               push ds                                  
  0111  680327           push 0x2703                              
  0114  9a8f470000       lcall 0, 0x478f                          -> 0000:478f
  0119  83c404           add sp, 4                                
  011c  1e               push ds                                  
  011d  681d27           push 0x271d                               ; "'h' Do not use expanded or extended memory"
  0120  9a8f470000       lcall 0, 0x478f                          -> 0000:478f
  0125  83c404           add sp, 4                                
  0128  1e               push ds                                  
  0129  684827           push 0x2748                               ; "'s' Use alternate army names"
  012c  9a8f470000       lcall 0, 0x478f                          -> 0000:478f
  0131  83c404           add sp, 4                                
  0134  1e               push ds                                  
  0135  686527           push 0x2765                               ; "'m' Mono version, for laptop use"
  0138  9a8f470000       lcall 0, 0x478f                          -> 0000:478f
  013d  83c404           add sp, 4                                
  0140  1e               push ds                                  
  0141  688627           push 0x2786                               ; "'v' No talking advisor"
  0144  9a8f470000       lcall 0, 0x478f                          -> 0000:478f
  0149  83c404           add sp, 4                                
  014c  1e               push ds                                  
  014d  689d27           push 0x279d                               ; "'n' No startup animation"
  0150  9a8f470000       lcall 0, 0x478f                          -> 0000:478f
  0155  83c404           add sp, 4                                
  0158  6a01             push 1                                   
  015a  9ac71c0000       lcall 0, 0x1cc7                          -> 0000:1cc7
  015f  59               pop cx                                   
  0160  47               inc di                                   
  0161  3b7e06           cmp di, word ptr [bp + 6]                
  0164  7d03             jge 0x169                                
  0166  e900ff           jmp 0x69                                 
  0169  837efc00         cmp word ptr [bp - 4], 0                 
  016d  7515             jne 0x184                                
  016f  837efe00         cmp word ptr [bp - 2], 0                 
  0173  750f             jne 0x184                                
  0175  666a00           push 0                                   
  0178  6a00             push 0                                   
  017a  9aef08de15       lcall 0x15de, 0x8ef                      -> 15de:08ef
  017f  83c406           add sp, 6                                
  0182  0bc0             or ax, ax                                
  0184  837efc00         cmp word ptr [bp - 4], 0                 
  0188  7410             je 0x19a                                 
  018a  666a00           push 0                                   
  018d  666a00           push 0                                   
  0190  9ab90ade15       lcall 0x15de, 0xab9                      -> 15de:0ab9
  0195  83c408           add sp, 8                                
  0198  0bc0             or ax, ax                                
  019a  c606dc5c04       mov byte ptr [0x5cdc], 4                 
  019f  a0dc5c           mov al, byte ptr [0x5cdc]                
  01a2  b400             mov ah, 0                                
  01a4  50               push ax                                  
  01a5  9a8c00a30e       lcall 0xea3, 0x8c                        -> 0ea3:008c
  01aa  59               pop cx                                   
  01ab  50               push ax                                  
  01ac  9a43001210       lcall 0x1012, 0x43                       -> 1012:0043
  01b1  59               pop cx                                   
  01b2  9a09001d15       lcall 0x151d, 9                          -> 151d:0009
  01b7  9a6600c130       lcall 0x30c1, 0x66                       -> ovl59:03a0
  01bc  9a05005e15       lcall 0x155e, 5                          -> 155e:0005
  01c1  98               cwde                                     
  01c2  0bc0             or ax, ax                                
  01c4  7511             jne 0x1d7                                
  01c6  1e               push ds                                  
  01c7  68b727           push 0x27b7                               ; "Can't init sound"
  01ca  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  01cf  83c404           add sp, 4                                
  01d2  90               nop                                      
  01d3  0e               push cs                                  
  01d4  e8de00           call 0x2b5                               
  01d7  9a4800ba30       lcall 0x30ba, 0x48                       -> ovl58:0bc5
  01dc  9a2a009930       lcall 0x3099, 0x2a                       -> ovl53:02cd
  01e1  9a2f00f930       lcall 0x30f9, 0x2f                       -> ovl64:0000
  01e6  c606dd5c01       mov byte ptr [0x5cdd], 1                 
  01eb  9a4b008f0e       lcall 0xe8f, 0x4b                        -> 0e8f:004b
  01f0  9a93008f0e       lcall 0xe8f, 0x93                        -> 0e8f:0093
  01f5  9af8008f0e       lcall 0xe8f, 0xf8                        -> 0e8f:00f8
  01fa  9a4300c130       lcall 0x30c1, 0x43                       -> ovl59:0356
  01ff  c706de5c0600     mov word ptr [0x5cde], 6                 
  0205  0bf6             or si, si                                
  0207  742f             je 0x238                                 
  0209  660fbfc6         movsx eax, si                            
  020d  6669c0e8030000   imul eax, eax, 0x3e8                     
  0214  668946f6         mov dword ptr [bp - 0xa], eax            
  0218  666a00           push 0                                   
  021b  6a00             push 0                                   
  021d  6650             push eax                                 
  021f  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  0224  83c40a           add sp, 0xa                              
  0227  8916da5c         mov word ptr [0x5cda], dx                
  022b  a3d85c           mov word ptr [0x5cd8], ax                
  022e  52               push dx                                  
  022f  50               push ax                                  
  0230  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0235  83c404           add sp, 4                                
  0238  6a02             push 2                                   
  023a  9a2000a230       lcall 0x30a2, 0x20                       -> ovl55:0000
  023f  59               pop cx                                   
  0240  6a01             push 1                                   
  0242  9aca00d730       lcall 0x30d7, 0xca                       -> ovl61:092a
  0247  59               pop cx                                   
  0248  6a00             push 0                                   
  024a  9a2000a230       lcall 0x30a2, 0x20                       -> ovl55:0000
  024f  59               pop cx                                   
  0250  9a39007f30       lcall 0x307f, 0x39                       -> ovl49:0e5f
  0255  9a43007f30       lcall 0x307f, 0x43                       -> ovl49:1029
  025a  9a7a00f930       lcall 0x30f9, 0x7a                       -> ovl64:0ccf
  025f  9a20008a30       lcall 0x308a, 0x20                       -> ovl50:0000
  0264  6a00             push 0                                   
  0266  9a20009d30       lcall 0x309d, 0x20                       -> ovl54:0052
  026b  59               pop cx                                   
  026c  9a0e00a908       lcall 0x8a9, 0xe                         -> 08a9:000e
  0271  5f               pop di                                   
  0272  5e               pop si                                   
  0273  c9               leave                                    
  0274  cb               retf                                     
  0275  3000             xor byte ptr [bx + si], al               
  0277  3100             xor word ptr [bx + si], ax               
  0279  3200             xor al, byte ptr [bx + si]               
  027b  3300             xor ax, word ptr [bx + si]               
  027d  3400             xor al, 0                                
  027f  350036           xor ax, 0x3600                           
  0282  0037             add byte ptr [bx], dh                    
  0284  0038             add byte ptr [bx + si], bh               
  0286  0039             add byte ptr [bx + di], bh               
  0288  006800           add byte ptr [bx + si], ch               
  028b  6d               insw word ptr es:[di], dx                
  028c  006e00           add byte ptr [bp], ch                    
  028f  7300             jae 0x291                                
  0291  7600             jbe 0x293                                
  0293  7800             js 0x295                                 
  0295  ce               into                                     
  0296  00ce             add dh, cl                               
  0298  00ce             add dh, cl                               
  029a  00ce             add dh, cl                               
  029c  00ce             add dh, cl                               
  029e  00ce             add dh, cl                               
  02a0  00ce             add dh, cl                               
  02a2  00ce             add dh, cl                               
  02a4  00ce             add dh, cl                               
  02a6  00ce             add dh, cl                               
  02a8  00c6             add dh, al                               
  02aa  0000             add byte ptr [bx + si], al               
  02ac  016001           add word ptr [bx + si + 1], sp           
  02af  f8               clc                                      
  02b0  0008             add byte ptr [bx + si], cl               
  02b2  01be00           db 01be00                                resync

res_0a4c_02b5:  ; ENTRY
  02b5  55               push bp                                  
  02b6  8bec             mov bp, sp                               
  02b8  9aa0025e15       lcall 0x155e, 0x2a0                      -> 155e:02a0
  02bd  9a3400f930       lcall 0x30f9, 0x34                       -> ovl64:0042
  02c2  9a25008a30       lcall 0x308a, 0x25                       -> ovl50:063e
  02c7  6a03             push 3                                   
  02c9  9a0d005315       lcall 0x1553, 0xd                        -> 1553:000d
  02ce  59               pop cx                                   
  02cf  9a5700ba30       lcall 0x30ba, 0x57                       -> ovl58:0cfc
  02d4  9a70008f0e       lcall 0xe8f, 0x70                        -> 0e8f:0070
  02d9  9ac6008f0e       lcall 0xe8f, 0xc6                        -> 0e8f:00c6
  02de  9a1e018f0e       lcall 0xe8f, 0x11e                       -> 0e8f:011e
  02e3  9a2a009630       lcall 0x3096, 0x2a                       -> ovl52:004f
  02e8  9a290abf12       lcall 0x12bf, 0xa29                      -> 12bf:0a29
  02ed  9a80001d15       lcall 0x151d, 0x80                       -> 151d:0080
  02f2  1e               push ds                                  
  02f3  68f827           push 0x27f8                               ; "Version 1.02"
  02f6  1e               push ds                                  
  02f7  68c927           push 0x27c9                               ; "Warlords ][ - %s (c) Strategic Studies Group"
  02fa  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  02ff  83c408           add sp, 8                                
  0302  6a00             push 0                                   
  0304  9ac71c0000       lcall 0, 0x1cc7                          -> 0000:1cc7
  0309  59               pop cx                                   
  030a  5d               pop bp                                   
  030b  cb               retf                                     

res_0a4c_030c:  ; ENTRY
  030c  55               push bp                                  
  030d  8bec             mov bp, sp                               
  030f  83ec0c           sub sp, 0xc                              
  0312  9ac502280d       lcall 0xd28, 0x2c5                       -> 0d28:02c5
  0317  16               push ss                                  
  0318  8d46f4           lea ax, [bp - 0xc]                       
  031b  50               push ax                                  
  031c  16               push ss                                  
  031d  8d46f8           lea ax, [bp - 8]                         
  0320  50               push ax                                  
  0321  16               push ss                                  
  0322  8d46fc           lea ax, [bp - 4]                         
  0325  50               push ax                                  
  0326  9a0508280d       lcall 0xd28, 0x805                       -> 0d28:0805
  032b  83c40c           add sp, 0xc                              
  032e  66ff76f4         push dword ptr [bp - 0xc]                
  0332  66ff76f8         push dword ptr [bp - 8]                  
  0336  66ff76fc         push dword ptr [bp - 4]                  
  033a  1e               push ds                                  
  033b  680528           push 0x2805                               ; "Conv:%lu  MaxBlock:%lu  Lock:%lu"
  033e  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  0343  83c410           add sp, 0x10                             
  0346  c9               leave                                    
  0347  cb               retf                                     

res_0a4c_0348:  ; ENTRY
  0348  55               push bp                                  
  0349  8bec             mov bp, sp                               
  034b  83ec0c           sub sp, 0xc                              
  034e  9ac502280d       lcall 0xd28, 0x2c5                       -> 0d28:02c5
  0353  16               push ss                                  
  0354  8d46f4           lea ax, [bp - 0xc]                       
  0357  50               push ax                                  
  0358  16               push ss                                  
  0359  8d46f8           lea ax, [bp - 8]                         
  035c  50               push ax                                  
  035d  16               push ss                                  
  035e  8d46fc           lea ax, [bp - 4]                         
  0361  50               push ax                                  
  0362  9a0508280d       lcall 0xd28, 0x805                       -> 0d28:0805
  0367  83c40c           add sp, 0xc                              
  036a  66ff76f4         push dword ptr [bp - 0xc]                
  036e  66ff76f8         push dword ptr [bp - 8]                  
  0372  66ff76fc         push dword ptr [bp - 4]                  
  0376  1e               push ds                                  
  0377  682728           push 0x2827                               ; "Conv:%lu  MaxBlock:%lu  Lock:%lu"
  037a  1e               push ds                                  
  037b  68885c           push 0x5c88                              
  037e  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0383  83c414           add sp, 0x14                             
  0386  c9               leave                                    
  0387  cb               retf                                     
  0388  55               push bp                                  
  0389  8bec             mov bp, sp                               
  038b  66ff7606         push dword ptr [bp + 6]                  
  038f  1e               push ds                                  
  0390  684828           push 0x2848                               ; "Out of memory at %lu"
  0393  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  0398  83c408           add sp, 8                                
  039b  0e               push cs                                  
  039c  e86dff           call 0x30c                               
  039f  8b1e8032         mov bx, word ptr [0x3280]                
  03a3  4b               dec bx                                   
  03a4  83fb05           cmp bx, 5                                
  03a7  7731             ja 0x3da                                 
  03a9  d1e3             shl bx, 1                                
  03ab  2effa7e503       jmp word ptr cs:[bx + 0x3e5]             
res_0a4c_03b0:  ; case
  03b0  1e               push ds                                  
  03b1  685e28           push 0x285e                               ; "Out of mem handles"
  03b4  eb1c             jmp 0x3d2                                
res_0a4c_03b6:  ; case
  03b6  1e               push ds                                  
  03b7  687128           push 0x2871                               ; "Out of memory"
  03ba  eb16             jmp 0x3d2                                
res_0a4c_03bc:  ; case
  03bc  1e               push ds                                  
  03bd  687f28           push 0x287f                               ; "Too much memory locked"
  03c0  eb10             jmp 0x3d2                                
res_0a4c_03c2:  ; case
  03c2  1e               push ds                                  
  03c3  689628           push 0x2896                               ; "Bad handle"
  03c6  eb0a             jmp 0x3d2                                
res_0a4c_03c8:  ; case
  03c8  1e               push ds                                  
  03c9  68a128           push 0x28a1                               ; "Invalid handle"
  03cc  eb04             jmp 0x3d2                                
res_0a4c_03ce:  ; case
  03ce  1e               push ds                                  
  03cf  68b028           push 0x28b0                               ; "Block/handle mismatch"
  03d2  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  03d7  83c404           add sp, 4                                
  03da  9a08370000       lcall 0, 0x3708                          -> 0000:3708
  03df  0e               push cs                                  
  03e0  e8d2fe           call 0x2b5                               
  03e3  5d               pop bp                                   
  03e4  cb               retf                                     
  03e5  b003b603bc03c203 dw 03b0,03b6,03bc,03c2,03c8,03ce         jump table
  03f1  55               push bp                                  
