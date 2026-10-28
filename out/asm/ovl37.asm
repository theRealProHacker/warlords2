; ovl37 stub 302c file_off 0x5e790 size 0x524

ovl37_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec0c           sub sp, 0xc                              
  0006  56               push si                                  
  0007  57               push di                                  
  0008  8b7606           mov si, word ptr [bp + 6]                
  000b  8b7e08           mov di, word ptr [bp + 8]                
  000e  666820001d00     push 0x1d0020                            
  0014  666a20           push 0x20                                
  0017  16               push ss                                  
  0018  8d46f8           lea ax, [bp - 8]                         
  001b  50               push ax                                  
  001c  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0021  83c40c           add sp, 0xc                              
  0024  57               push di                                  
  0025  56               push si                                  
  0026  16               push ss                                  
  0027  8d46f4           lea ax, [bp - 0xc]                       
  002a  50               push ax                                  
  002b  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  0030  83c408           add sp, 8                                
  0033  66ff76f4         push dword ptr [bp - 0xc]                
  0037  8d46f8           lea ax, [bp - 8]                         
  003a  8cd2             mov dx, ss                               
  003c  b90800           mov cx, 8                                
  003f  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0044  6a09             push 9                                   
  0046  9a7e029709       lcall 0x997, 0x27e                       -> 0997:027e
  004b  83c40e           add sp, 0xe                              
  004e  837e0a00         cmp word ptr [bp + 0xa], 0               
  0052  7404             je 0x58                                  
  0054  6a05             push 5                                   
  0056  eb02             jmp 0x5a                                 
  0058  6a02             push 2                                   
  005a  9a4800c130       lcall 0x30c1, 0x48                       -> ovl59:0000
  005f  59               pop cx                                   
  0060  8bc7             mov ax, di                               
  0062  05c4ff           add ax, 0xffc4                           
  0065  ba3801           mov dx, 0x138                            
  0068  2bd0             sub dx, ax                               
  006a  83c2e2           add dx, -0x1e                            
  006d  52               push dx                                  
  006e  8bc6             mov ax, si                               
  0070  0560ff           add ax, 0xff60                           
  0073  ba4001           mov dx, 0x140                            
  0076  2bd0             sub dx, ax                               
  0078  83c2e0           add dx, -0x20                            
  007b  52               push dx                                  
  007c  8bc7             mov ax, di                               
  007e  05c4ff           add ax, 0xffc4                           
  0081  50               push ax                                  
  0082  8bc6             mov ax, si                               
  0084  0560ff           add ax, 0xff60                           
  0087  50               push ax                                  
  0088  9a2f00ac2f       lcall 0x2fac, 0x2f                       -> ovl17:07e4
  008d  83c408           add sp, 8                                
  0090  5f               pop di                                   
  0091  5e               pop si                                   
  0092  c9               leave                                    
  0093  cb               retf                                     

ovl37_0094:  ; ENTRY
  0094  55               push bp                                  
  0095  8bec             mov bp, sp                               
  0097  83ec04           sub sp, 4                                
  009a  56               push si                                  
  009b  57               push di                                  
  009c  c746fe0000       mov word ptr [bp - 2], 0                 
  00a1  c746fc0000       mov word ptr [bp - 4], 0                 
  00a6  be0100           mov si, 1                                
  00a9  33ff             xor di, di                               
  00ab  e99e00           jmp 0x14c                                
  00ae  9adc380000       lcall 0, 0x38dc                          -> 0000:38dc
  00b3  0bc0             or ax, ax                                
  00b5  7419             je 0xd0                                  
  00b7  9a08370000       lcall 0, 0x3708                          -> 0000:3708
  00bc  8bd0             mov dx, ax                               
  00be  0bd2             or dx, dx                                
  00c0  7507             jne 0xc9                                 
  00c2  9a08370000       lcall 0, 0x3708                          -> 0000:3708
  00c7  8bd0             mov dx, ax                               
  00c9  83fa20           cmp dx, 0x20                             
  00cc  7502             jne 0xd0                                 
  00ce  33f6             xor si, si                               
  00d0  80bdb54101       cmp byte ptr [di + 0x41b5], 1            
  00d5  752f             jne 0x106                                
  00d7  0bf6             or si, si                                
  00d9  7408             je 0xe3                                  
  00db  6a00             push 0                                   
  00dd  9a2a00ba30       lcall 0x30ba, 0x2a                       -> ovl58:0181
  00e2  59               pop cx                                   
  00e3  56               push si                                  
  00e4  8b5efe           mov bx, word ptr [bp - 2]                
  00e7  d1e3             shl bx, 1                                
  00e9  ffb7a843         push word ptr [bx + 0x43a8]              
  00ed  8b5efe           mov bx, word ptr [bp - 2]                
  00f0  d1e3             shl bx, 1                                
  00f2  ffb7f843         push word ptr [bx + 0x43f8]              
  00f6  0e               push cs                                  
  00f7  e806ff           call 0                                   
  00fa  83c406           add sp, 6                                
  00fd  ff46fe           inc word ptr [bp - 2]                    
  0100  0bf6             or si, si                                
  0102  7437             je 0x13b                                 
  0104  eb2d             jmp 0x133                                
  0106  0bf6             or si, si                                
  0108  7408             je 0x112                                 
  010a  6a01             push 1                                   
  010c  9a2a00ba30       lcall 0x30ba, 0x2a                       -> ovl58:0181
  0111  59               pop cx                                   
  0112  56               push si                                  
  0113  8b5efc           mov bx, word ptr [bp - 4]                
  0116  d1e3             shl bx, 1                                
  0118  ffb76843         push word ptr [bx + 0x4368]              
  011c  8b5efc           mov bx, word ptr [bp - 4]                
  011f  d1e3             shl bx, 1                                
  0121  ffb7b843         push word ptr [bx + 0x43b8]              
  0125  0e               push cs                                  
  0126  e8d7fe           call 0                                   
  0129  83c406           add sp, 6                                
  012c  ff46fc           inc word ptr [bp - 4]                    
  012f  0bf6             or si, si                                
  0131  7408             je 0x13b                                 
  0133  6a03             push 3                                   
  0135  9a4800c130       lcall 0x30c1, 0x48                       -> ovl59:0000
  013a  59               pop cx                                   
  013b  0bf6             or si, si                                
  013d  7404             je 0x143                                 
  013f  6a05             push 5                                   
  0141  eb02             jmp 0x145                                
  0143  6a03             push 3                                   
  0145  9a4800c130       lcall 0x30c1, 0x48                       -> ovl59:0000
  014a  59               pop cx                                   
  014b  47               inc di                                   
  014c  a0b441           mov al, byte ptr [0x41b4]                
  014f  98               cwde                                     
  0150  3bc7             cmp ax, di                               
  0152  7e03             jle 0x157                                
  0154  e957ff           jmp 0xae                                 
  0157  9a6100c130       lcall 0x30c1, 0x61                       -> ovl59:01f1
  015c  5f               pop di                                   
  015d  5e               pop si                                   
  015e  c9               leave                                    
  015f  cb               retf                                     

ovl37_0160:  ; ENTRY
  0160  55               push bp                                  
  0161  8bec             mov bp, sp                               
  0163  83ec10           sub sp, 0x10                             
  0166  56               push si                                  
  0167  57               push di                                  
  0168  8b7606           mov si, word ptr [bp + 6]                
  016b  90               nop                                      
  016c  0e               push cs                                  
  016d  e8ac02           call 0x41c                               
  0170  0bf6             or si, si                                
  0172  740b             je 0x17f                                 
  0174  c41edd41         les bx, ptr [0x41dd]                     
  0178  268a4714         mov al, byte ptr es:[bx + 0x14]          
  017c  98               cwde                                     
  017d  eb04             jmp 0x183                                
  017f  a0c542           mov al, byte ptr [0x42c5]                
  0182  98               cwde                                     
  0183  8946fc           mov word ptr [bp - 4], ax                
  0186  a0c442           mov al, byte ptr [0x42c4]                
  0189  98               cwde                                     
  018a  8946fe           mov word ptr [bp - 2], ax                
  018d  33ff             xor di, di                               
  018f  0bf6             or si, si                                
  0191  7405             je 0x198                                 
  0193  c606fb4108       mov byte ptr [0x41fb], 8                 
  0198  8b46fe           mov ax, word ptr [bp - 2]                
  019b  0346fc           add ax, word ptr [bp - 4]                
  019e  a3440d           mov word ptr [0xd44], ax                 
  01a1  33f6             xor si, si                               
  01a3  eb15             jmp 0x1ba                                
  01a5  8bde             mov bx, si                               
  01a7  d1e3             shl bx, 1                                
  01a9  c787b843ffff     mov word ptr [bx + 0x43b8], 0xffff       
  01af  8bde             mov bx, si                               
  01b1  d1e3             shl bx, 1                                
  01b3  c7876843ffff     mov word ptr [bx + 0x4368], 0xffff       
  01b9  46               inc si                                   
  01ba  83fe28           cmp si, 0x28                             
  01bd  7ce6             jl 0x1a5                                 
  01bf  e9b000           jmp 0x272                                
  01c2  837efc08         cmp word ptr [bp - 4], 8                 
  01c6  7c41             jl 0x209                                 
  01c8  b90800           mov cx, 8                                
  01cb  eb2c             jmp 0x1f9                                
  01cd  8bd9             mov bx, cx                               
  01cf  d1e3             shl bx, 1                                
  01d1  8b871e0d         mov ax, word ptr [bx + 0xd1e]            
  01d5  8bdf             mov bx, di                               
  01d7  03d9             add bx, cx                               
  01d9  d1e3             shl bx, 1                                
  01db  8987b843         mov word ptr [bx + 0x43b8], ax           
  01df  8bc7             mov ax, di                               
  01e1  bb0800           mov bx, 8                                
  01e4  99               cdq                                      
  01e5  f7fb             idiv bx                                  
  01e7  d1e0             shl ax, 1                                
  01e9  8bd8             mov bx, ax                               
  01eb  8b87140d         mov ax, word ptr [bx + 0xd14]            
  01ef  8bdf             mov bx, di                               
  01f1  03d9             add bx, cx                               
  01f3  d1e3             shl bx, 1                                
  01f5  89876843         mov word ptr [bx + 0x4368], ax           
  01f9  8bc1             mov ax, cx                               
  01fb  49               dec cx                                   
  01fc  0bc0             or ax, ax                                
  01fe  75cd             jne 0x1cd                                
  0200  83c708           add di, 8                                
  0203  836efc08         sub word ptr [bp - 4], 8                 
  0207  eb69             jmp 0x272                                
  0209  8b46fc           mov ax, word ptr [bp - 4]                
  020c  40               inc ax                                   
  020d  99               cdq                                      
  020e  2bc2             sub ax, dx                               
  0210  d1f8             sar ax, 1                                
  0212  be0400           mov si, 4                                
  0215  2bf0             sub si, ax                               
  0217  837efc00         cmp word ptr [bp - 4], 0                 
  021b  744d             je 0x26a                                 
  021d  8b4efc           mov cx, word ptr [bp - 4]                
  0220  eb41             jmp 0x263                                
  0222  f746fc0100       test word ptr [bp - 4], 1                
  0227  740c             je 0x235                                 
  0229  8bde             mov bx, si                               
  022b  03d9             add bx, cx                               
  022d  d1e3             shl bx, 1                                
  022f  8b872e0d         mov ax, word ptr [bx + 0xd2e]            
  0233  eb0a             jmp 0x23f                                
  0235  8bde             mov bx, si                               
  0237  03d9             add bx, cx                               
  0239  d1e3             shl bx, 1                                
  023b  8b871e0d         mov ax, word ptr [bx + 0xd1e]            
  023f  8bdf             mov bx, di                               
  0241  03d9             add bx, cx                               
  0243  d1e3             shl bx, 1                                
  0245  8987b843         mov word ptr [bx + 0x43b8], ax           
  0249  8bc7             mov ax, di                               
  024b  bb0800           mov bx, 8                                
  024e  99               cdq                                      
  024f  f7fb             idiv bx                                  
  0251  d1e0             shl ax, 1                                
  0253  8bd8             mov bx, ax                               
  0255  8b87140d         mov ax, word ptr [bx + 0xd14]            
  0259  8bdf             mov bx, di                               
  025b  03d9             add bx, cx                               
  025d  d1e3             shl bx, 1                                
  025f  89876843         mov word ptr [bx + 0x4368], ax           
  0263  8bc1             mov ax, cx                               
  0265  49               dec cx                                   
  0266  0bc0             or ax, ax                                
  0268  75b8             jne 0x222                                
  026a  037efc           add di, word ptr [bp - 4]                
  026d  c746fc0000       mov word ptr [bp - 4], 0                 
  0272  837efc00         cmp word ptr [bp - 4], 0                 
  0276  7403             je 0x27b                                 
  0278  e947ff           jmp 0x1c2                                
  027b  bf2000           mov di, 0x20                             
  027e  8b46fe           mov ax, word ptr [bp - 2]                
  0281  40               inc ax                                   
  0282  99               cdq                                      
  0283  2bc2             sub ax, dx                               
  0285  d1f8             sar ax, 1                                
  0287  be0400           mov si, 4                                
  028a  2bf0             sub si, ax                               
  028c  837efe00         cmp word ptr [bp - 2], 0                 
  0290  744d             je 0x2df                                 
  0292  8b4efe           mov cx, word ptr [bp - 2]                
  0295  eb41             jmp 0x2d8                                
  0297  f746fe0100       test word ptr [bp - 2], 1                
  029c  740c             je 0x2aa                                 
  029e  8bde             mov bx, si                               
  02a0  03d9             add bx, cx                               
  02a2  d1e3             shl bx, 1                                
  02a4  8b872e0d         mov ax, word ptr [bx + 0xd2e]            
  02a8  eb0a             jmp 0x2b4                                
  02aa  8bde             mov bx, si                               
  02ac  03d9             add bx, cx                               
  02ae  d1e3             shl bx, 1                                
  02b0  8b871e0d         mov ax, word ptr [bx + 0xd1e]            
  02b4  8bdf             mov bx, di                               
  02b6  03d9             add bx, cx                               
  02b8  d1e3             shl bx, 1                                
  02ba  8987b843         mov word ptr [bx + 0x43b8], ax           
  02be  8bc7             mov ax, di                               
  02c0  bb0800           mov bx, 8                                
  02c3  99               cdq                                      
  02c4  f7fb             idiv bx                                  
  02c6  d1e0             shl ax, 1                                
  02c8  8bd8             mov bx, ax                               
  02ca  8b87140d         mov ax, word ptr [bx + 0xd14]            
  02ce  8bdf             mov bx, di                               
  02d0  03d9             add bx, cx                               
  02d2  d1e3             shl bx, 1                                
  02d4  89876843         mov word ptr [bx + 0x4368], ax           
  02d8  8bc1             mov ax, cx                               
  02da  49               dec cx                                   
  02db  0bc0             or ax, ax                                
  02dd  75b8             jne 0x297                                
  02df  33f6             xor si, si                               
  02e1  e92c01           jmp 0x410                                
  02e4  8bde             mov bx, si                               
  02e6  d1e3             shl bx, 1                                
  02e8  83bfb843ff       cmp word ptr [bx + 0x43b8], -1           
  02ed  7503             jne 0x2f2                                
  02ef  e91d01           jmp 0x40f                                
  02f2  83fe20           cmp si, 0x20                             
  02f5  7d03             jge 0x2fa                                
  02f7  e98700           jmp 0x381                                
  02fa  80bcdc4100       cmp byte ptr [si + 0x41dc], 0            
  02ff  7455             je 0x356                                 
  0301  8bde             mov bx, si                               
  0303  d1e3             shl bx, 1                                
  0305  8b876843         mov ax, word ptr [bx + 0x4368]           
  0309  050a00           add ax, 0xa                              
  030c  50               push ax                                  
  030d  8bde             mov bx, si                               
  030f  d1e3             shl bx, 1                                
  0311  ffb7b843         push word ptr [bx + 0x43b8]              
  0315  16               push ss                                  
  0316  8d46f8           lea ax, [bp - 8]                         
  0319  50               push ax                                  
  031a  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  031f  83c408           add sp, 8                                
  0322  666820001200     push 0x120020                            
  0328  66680000a200     push 0xa20000                            
  032e  16               push ss                                  
  032f  8d46f0           lea ax, [bp - 0x10]                      
  0332  50               push ax                                  
  0333  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0338  83c40c           add sp, 0xc                              
  033b  66ff76f8         push dword ptr [bp - 8]                  
  033f  8d46f0           lea ax, [bp - 0x10]                      
  0342  8cd2             mov dx, ss                               
  0344  b90800           mov cx, 8                                
  0347  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  034c  6a0b             push 0xb                                 
  034e  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0353  83c40e           add sp, 0xe                              
  0356  666a00           push 0                                   
  0359  666a00           push 0                                   
  035c  666a00           push 0                                   
  035f  6a00             push 0                                   
  0361  8bde             mov bx, si                               
  0363  d1e3             shl bx, 1                                
  0365  ffb76843         push word ptr [bx + 0x4368]              
  0369  8bde             mov bx, si                               
  036b  d1e3             shl bx, 1                                
  036d  ffb7b843         push word ptr [bx + 0x43b8]              
  0371  1e               push ds                                  
  0372  682a34           push 0x342a                              
  0375  a0fa41           mov al, byte ptr [0x41fa]                
  0378  98               cwde                                     
  0379  50               push ax                                  
  037a  8a842c42         mov al, byte ptr [si + 0x422c]           
  037e  e98400           jmp 0x405                                
  0381  80bc044200       cmp byte ptr [si + 0x4204], 0            
  0386  7455             je 0x3dd                                 
  0388  8bde             mov bx, si                               
  038a  d1e3             shl bx, 1                                
  038c  8b876843         mov ax, word ptr [bx + 0x4368]           
  0390  050a00           add ax, 0xa                              
  0393  50               push ax                                  
  0394  8bde             mov bx, si                               
  0396  d1e3             shl bx, 1                                
  0398  ffb7b843         push word ptr [bx + 0x43b8]              
  039c  16               push ss                                  
  039d  8d46f8           lea ax, [bp - 8]                         
  03a0  50               push ax                                  
  03a1  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  03a6  83c408           add sp, 8                                
  03a9  666820001200     push 0x120020                            
  03af  66680000a200     push 0xa20000                            
  03b5  16               push ss                                  
  03b6  8d46f0           lea ax, [bp - 0x10]                      
  03b9  50               push ax                                  
  03ba  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  03bf  83c40c           add sp, 0xc                              
  03c2  66ff76f8         push dword ptr [bp - 8]                  
  03c6  8d46f0           lea ax, [bp - 0x10]                      
  03c9  8cd2             mov dx, ss                               
  03cb  b90800           mov cx, 8                                
  03ce  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  03d3  6a0b             push 0xb                                 
  03d5  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  03da  83c40e           add sp, 0xe                              
  03dd  666a00           push 0                                   
  03e0  666a00           push 0                                   
  03e3  666a00           push 0                                   
  03e6  6a00             push 0                                   
  03e8  8bde             mov bx, si                               
  03ea  d1e3             shl bx, 1                                
  03ec  ffb76843         push word ptr [bx + 0x4368]              
  03f0  8bde             mov bx, si                               
  03f2  d1e3             shl bx, 1                                
  03f4  ffb7b843         push word ptr [bx + 0x43b8]              
  03f8  1e               push ds                                  
  03f9  682a34           push 0x342a                              
  03fc  a0fb41           mov al, byte ptr [0x41fb]                
  03ff  98               cwde                                     
  0400  50               push ax                                  
  0401  8a845442         mov al, byte ptr [si + 0x4254]           
  0405  98               cwde                                     
  0406  50               push ax                                  
  0407  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  040c  83c41a           add sp, 0x1a                             
  040f  46               inc si                                   
  0410  83fe28           cmp si, 0x28                             
  0413  7d03             jge 0x418                                
  0415  e9ccfe           jmp 0x2e4                                
  0418  5f               pop di                                   
  0419  5e               pop si                                   
  041a  c9               leave                                    
  041b  cb               retf                                     

ovl37_041c:  ; ENTRY
  041c  55               push bp                                  
  041d  8bec             mov bp, sp                               
  041f  56               push si                                  
  0420  57               push di                                  
  0421  6a08             push 8                                   
  0423  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  0428  59               pop cx                                   
  0429  c70666432a01     mov word ptr [0x4366], 0x12a             
  042f  803efa410f       cmp byte ptr [0x41fa], 0xf               
  0434  7505             jne 0x43b                                
  0436  b80800           mov ax, 8                                
  0439  eb04             jmp 0x43f                                
  043b  a0fa41           mov al, byte ptr [0x41fa]                
  043e  98               cwde                                     
  043f  8bf0             mov si, ax                               
  0441  803efb410f       cmp byte ptr [0x41fb], 0xf               
  0446  7505             jne 0x44d                                
  0448  b80800           mov ax, 8                                
  044b  eb04             jmp 0x451                                
  044d  a0fb41           mov al, byte ptr [0x41fb]                
  0450  98               cwde                                     
  0451  8bf8             mov di, ax                               
  0453  6a26             push 0x26                                
  0455  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  045a  59               pop cx                                   
  045b  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0460  6a00             push 0                                   
  0462  8bc7             mov ax, di                               
  0464  c1e005           shl ax, 5                                
  0467  50               push ax                                  
  0468  1e               push ds                                  
  0469  688153           push 0x5381                              
  046c  66ff363c0d       push dword ptr [0xd3c]                   
  0471  1e               push ds                                  
  0472  682a34           push 0x342a                              
  0475  666820002400     push 0x240020                            
  047b  6a00             push 0                                   
  047d  8bc7             mov ax, di                               
  047f  c1e005           shl ax, 5                                
  0482  50               push ax                                  
  0483  1e               push ds                                  
  0484  68bc53           push 0x53bc                              
  0487  ff1ec869         lcall [0x69c8]                           
  048b  83c41c           add sp, 0x1c                             
  048e  6a00             push 0                                   
  0490  8bc6             mov ax, si                               
  0492  c1e005           shl ax, 5                                
  0495  50               push ax                                  
  0496  1e               push ds                                  
  0497  688153           push 0x5381                              
  049a  66ff36400d       push dword ptr [0xd40]                   
  049f  1e               push ds                                  
  04a0  682a34           push 0x342a                              
  04a3  666820002400     push 0x240020                            
  04a9  6a00             push 0                                   
  04ab  8bc6             mov ax, si                               
  04ad  c1e005           shl ax, 5                                
  04b0  50               push ax                                  
  04b1  1e               push ds                                  
  04b2  68bc53           push 0x53bc                              
  04b5  ff1ec869         lcall [0x69c8]                           
  04b9  83c41c           add sp, 0x1c                             
  04bc  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  04c1  5f               pop di                                   
  04c2  5e               pop si                                   
  04c3  5d               pop bp                                   
  04c4  cb               retf                                     

ovl37_04c5:  ; ENTRY
  04c5  55               push bp                                  
  04c6  8bec             mov bp, sp                               
  04c8  666800000300     push 0x30000                             
  04ce  666802000f00     push 0xf0002                             
  04d4  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  04d9  83c408           add sp, 8                                
  04dc  66ff7606         push dword ptr [bp + 6]                  
  04e0  ff366643         push word ptr [0x4366]                   
  04e4  684001           push 0x140                               
  04e7  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  04ec  83c408           add sp, 8                                
  04ef  8306664314       add word ptr [0x4366], 0x14              
  04f4  5d               pop bp                                   
  04f5  cb               retf                                     

ovl37_04f6:  ; ENTRY
  04f6  55               push bp                                  
  04f7  8bec             mov bp, sp                               
  04f9  b8042c           mov ax, 0x2c04                           
  04fc  8ec0             mov es, ax                               
  04fe  268b1e1001       mov bx, word ptr es:[0x110]              
  0503  d1e3             shl bx, 1                                
  0505  b8042c           mov ax, 0x2c04                           
  0508  8ec0             mov es, ax                               
  050a  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  0510  750b             jne 0x51d                                
  0512  666a00           push 0                                   
  0515  9a8900d730       lcall 0x30d7, 0x89                       -> ovl61:10fb
  051a  83c404           add sp, 4                                
  051d  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  0522  5d               pop bp                                   
  0523  cb               retf                                     
