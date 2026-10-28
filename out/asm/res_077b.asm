; res_077b file_off 0x97b0
  000a  55               push bp                                  
  000b  8bec             mov bp, sp                               
  000d  c70656120100     mov word ptr [0x1256], 1                 
  0013  5d               pop bp                                   
  0014  cb               retf                                     
  0015  55               push bp                                  
  0016  8bec             mov bp, sp                               
  0018  c70656120000     mov word ptr [0x1256], 0                 
  001e  5d               pop bp                                   
  001f  cb               retf                                     

res_077b_0020:  ; ENTRY
  0020  55               push bp                                  
  0021  8bec             mov bp, sp                               
  0023  8b4606           mov ax, word ptr [bp + 6]                
  0026  a35212           mov word ptr [0x1252], ax                
  0029  8b4608           mov ax, word ptr [bp + 8]                
  002c  a35412           mov word ptr [0x1254], ax                
  002f  8b460a           mov ax, word ptr [bp + 0xa]              
  0032  a34c12           mov word ptr [0x124c], ax                
  0035  8b460c           mov ax, word ptr [bp + 0xc]              
  0038  a35012           mov word ptr [0x1250], ax                
  003b  5d               pop bp                                   
  003c  cb               retf                                     

res_077b_003d:  ; ENTRY
  003d  55               push bp                                  
  003e  8bec             mov bp, sp                               
  0040  833e4c1200       cmp word ptr [0x124c], 0                 
  0045  7410             je 0x57                                  
  0047  ff365412         push word ptr [0x1254]                   
  004b  ff365212         push word ptr [0x1252]                   
  004f  9a5700f930       lcall 0x30f9, 0x57                       -> ovl64:0238
  0054  83c404           add sp, 4                                
  0057  c7064c120000     mov word ptr [0x124c], 0                 
  005d  5d               pop bp                                   
  005e  cb               retf                                     

res_077b_005f:  ; ENTRY
  005f  55               push bp                                  
  0060  8bec             mov bp, sp                               
  0062  56               push si                                  
  0063  be0400           mov si, 4                                
  0066  eb07             jmp 0x6f                                 
  0068  56               push si                                  
  0069  90               nop                                      
  006a  0e               push cs                                  
  006b  e8f300           call 0x161                               
  006e  59               pop cx                                   
  006f  8bc6             mov ax, si                               
  0071  4e               dec si                                   
  0072  0bc0             or ax, ax                                
  0074  75f2             jne 0x68                                 
  0076  5e               pop si                                   
  0077  5d               pop bp                                   
  0078  cb               retf                                     
  0079  55               push bp                                  
  007a  8bec             mov bp, sp                               
  007c  833e581200       cmp word ptr [0x1258], 0                 
  0081  743c             je 0xbf                                  
  0083  c70658120000     mov word ptr [0x1258], 0                 
  0089  ba1500           mov dx, 0x15                             
  008c  eb2a             jmp 0xb8                                 
  008e  8bda             mov bx, dx                               
  0090  d1e3             shl bx, 1                                
  0092  33c0             xor ax, ax                               
  0094  8987f244         mov word ptr [bx + 0x44f2], ax           
  0098  8bda             mov bx, dx                               
  009a  d1e3             shl bx, 1                                
  009c  89871c45         mov word ptr [bx + 0x451c], ax           
  00a0  8bda             mov bx, dx                               
  00a2  d1e3             shl bx, 1                                
  00a4  89874645         mov word ptr [bx + 0x4546], ax           
  00a8  8bda             mov bx, dx                               
  00aa  d1e3             shl bx, 1                                
  00ac  89877045         mov word ptr [bx + 0x4570], ax           
  00b0  8bda             mov bx, dx                               
  00b2  d1e3             shl bx, 1                                
  00b4  89879a45         mov word ptr [bx + 0x459a], ax           
  00b8  8bc2             mov ax, dx                               
  00ba  4a               dec dx                                   
  00bb  0bc0             or ax, ax                                
  00bd  75cf             jne 0x8e                                 
  00bf  5d               pop bp                                   
  00c0  cb               retf                                     
  00c1  55               push bp                                  
  00c2  8bec             mov bp, sp                               
  00c4  833e581215       cmp word ptr [0x1258], 0x15              
  00c9  7f52             jg 0x11d                                 
  00cb  8b1e5812         mov bx, word ptr [0x1258]                
  00cf  d1e3             shl bx, 1                                
  00d1  8b4606           mov ax, word ptr [bp + 6]                
  00d4  89879a45         mov word ptr [bx + 0x459a], ax           
  00d8  8b1e5812         mov bx, word ptr [0x1258]                
  00dc  d1e3             shl bx, 1                                
  00de  8b4608           mov ax, word ptr [bp + 8]                
  00e1  89877045         mov word ptr [bx + 0x4570], ax           
  00e5  8b1e5812         mov bx, word ptr [0x1258]                
  00e9  d1e3             shl bx, 1                                
  00eb  8b460a           mov ax, word ptr [bp + 0xa]              
  00ee  89874645         mov word ptr [bx + 0x4546], ax           
  00f2  66680300ffff     push 0xffff0003                          
  00f8  6a01             push 1                                   
  00fa  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  00ff  83c406           add sp, 6                                
  0102  8b1e5812         mov bx, word ptr [0x1258]                
  0106  d1e3             shl bx, 1                                
  0108  89871c45         mov word ptr [bx + 0x451c], ax           
  010c  8b1e5812         mov bx, word ptr [0x1258]                
  0110  d1e3             shl bx, 1                                
  0112  8b460c           mov ax, word ptr [bp + 0xc]              
  0115  8987f244         mov word ptr [bx + 0x44f2], ax           
  0119  ff065812         inc word ptr [0x1258]                    
  011d  5d               pop bp                                   
  011e  cb               retf                                     

res_077b_011f:  ; ENTRY
  011f  55               push bp                                  
  0120  8bec             mov bp, sp                               
  0122  83ec04           sub sp, 4                                
  0125  9a8e00c130       lcall 0x30c1, 0x8e                       -> ovl59:0a7c
  012a  0bc0             or ax, ax                                
  012c  7531             jne 0x15f                                
  012e  16               push ss                                  
  012f  8d46fc           lea ax, [bp - 4]                         
  0132  50               push ax                                  
  0133  6a00             push 0                                   
  0135  9acf1b0000       lcall 0, 0x1bcf                          -> 0000:1bcf
  013a  83c406           add sp, 6                                
  013d  0bc0             or ax, ax                                
  013f  668b46fc         mov eax, dword ptr [bp - 4]              
  0143  663b064812       cmp eax, dword ptr [0x1248]              
  0148  7415             je 0x15f                                 
  014a  66a34812         mov dword ptr [0x1248], eax              
  014e  a15a12           mov ax, word ptr [0x125a]                
  0151  40               inc ax                                   
  0152  250700           and ax, 7                                
  0155  a35a12           mov word ptr [0x125a], ax                
  0158  50               push ax                                  
  0159  90               nop                                      
  015a  0e               push cs                                  
  015b  e80300           call 0x161                               
  015e  59               pop cx                                   
  015f  c9               leave                                    
  0160  cb               retf                                     

res_077b_0161:  ; ENTRY
  0161  55               push bp                                  
  0162  8bec             mov bp, sp                               
  0164  f746060300       test word ptr [bp + 6], 3                
  0169  7534             jne 0x19f                                
  016b  833e4c1200       cmp word ptr [0x124c], 0                 
  0170  742d             je 0x19f                                 
  0172  ff365012         push word ptr [0x1250]                   
  0176  8b1e4c12         mov bx, word ptr [0x124c]                
  017a  d1e3             shl bx, 1                                
  017c  8b875c12         mov ax, word ptr [bx + 0x125c]           
  0180  03064e12         add ax, word ptr [0x124e]                
  0184  50               push ax                                  
  0185  ff365412         push word ptr [0x1254]                   
  0189  ff365212         push word ptr [0x1252]                   
  018d  90               nop                                      
  018e  0e               push cs                                  
  018f  e80f00           call 0x1a1                               
  0192  83c408           add sp, 8                                
  0195  a14e12           mov ax, word ptr [0x124e]                
  0198  40               inc ax                                   
  0199  250300           and ax, 3                                
  019c  a34e12           mov word ptr [0x124e], ax                
  019f  5d               pop bp                                   
  01a0  cb               retf                                     

res_077b_01a1:  ; ENTRY
  01a1  55               push bp                                  
  01a2  8bec             mov bp, sp                               
  01a4  83ec1c           sub sp, 0x1c                             
  01a7  56               push si                                  
  01a8  57               push di                                  
  01a9  8b4e06           mov cx, word ptr [bp + 6]                
  01ac  8b7608           mov si, word ptr [bp + 8]                
  01af  33ff             xor di, di                               
  01b1  833e561200       cmp word ptr [0x1256], 0                 
  01b6  7403             je 0x1bb                                 
  01b8  e93902           jmp 0x3f4                                
  01bb  b8042c           mov ax, 0x2c04                           
  01be  8bd1             mov dx, cx                               
  01c0  8ec0             mov es, ax                               
  01c2  262b167701       sub dx, word ptr es:[0x177]              
  01c7  6bd205           imul dx, dx, 5                           
  01ca  83c202           add dx, 2                                
  01cd  8956f2           mov word ptr [bp - 0xe], dx              
  01d0  8bd6             mov dx, si                               
  01d2  8ec0             mov es, ax                               
  01d4  262b167501       sub dx, word ptr es:[0x175]              
  01d9  6bd228           imul dx, dx, 0x28                        
  01dc  83c21e           add dx, 0x1e                             
  01df  8956f0           mov word ptr [bp - 0x10], dx             
  01e2  8bc2             mov ax, dx                               
  01e4  8946f6           mov word ptr [bp - 0xa], ax              
  01e7  8b46f2           mov ax, word ptr [bp - 0xe]              
  01ea  c1e003           shl ax, 3                                
  01ed  8946f8           mov word ptr [bp - 8], ax                
  01f0  8b460a           mov ax, word ptr [bp + 0xa]              
  01f3  bb0400           mov bx, 4                                
  01f6  99               cdq                                      
  01f7  f7fb             idiv bx                                  
  01f9  c1e206           shl dx, 6                                
  01fc  8956fe           mov word ptr [bp - 2], dx                
  01ff  8b460a           mov ax, word ptr [bp + 0xa]              
  0202  99               cdq                                      
  0203  f7fb             idiv bx                                  
  0205  6bc028           imul ax, ax, 0x28                        
  0208  8946fc           mov word ptr [bp - 4], ax                
  020b  56               push si                                  
  020c  51               push cx                                  
  020d  90               nop                                      
  020e  0e               push cs                                  
  020f  e8e601           call 0x3f8                               
  0212  83c404           add sp, 4                                
  0215  0bc0             or ax, ax                                
  0217  7503             jne 0x21c                                
  0219  e9d801           jmp 0x3f4                                
  021c  c746f40100       mov word ptr [bp - 0xc], 1               
  0221  8b46fe           mov ax, word ptr [bp - 2]                
  0224  c1f803           sar ax, 3                                
  0227  50               push ax                                  
  0228  8b46fc           mov ax, word ptr [bp - 4]                
  022b  f72ec356         imul word ptr [0x56c3]                   
  022f  d1e0             shl ax, 1                                
  0231  5a               pop dx                                   
  0232  03d0             add dx, ax                               
  0234  8956fa           mov word ptr [bp - 6], dx                
  0237  16               push ss                                  
  0238  8d46ec           lea ax, [bp - 0x14]                      
  023b  50               push ax                                  
  023c  16               push ss                                  
  023d  8d46ee           lea ax, [bp - 0x12]                      
  0240  50               push ax                                  
  0241  9abd0abf12       lcall 0x12bf, 0xabd                      -> 12bf:0abd
  0246  83c408           add sp, 8                                
  0249  9a2a0bbf12       lcall 0x12bf, 0xb2a                      -> 12bf:0b2a
  024e  8956ea           mov word ptr [bp - 0x16], dx             
  0251  8946e8           mov word ptr [bp - 0x18], ax             
  0254  8b46f8           mov ax, word ptr [bp - 8]                
  0257  03066812         add ax, word ptr [0x1268]                
  025b  3b46ee           cmp ax, word ptr [bp - 0x12]             
  025e  7c2a             jl 0x28a                                 
  0260  c45ee8           les bx, ptr [bp - 0x18]                  
  0263  8b46f8           mov ax, word ptr [bp - 8]                
  0266  262b4704         sub ax, word ptr es:[bx + 4]             
  026a  3b46ee           cmp ax, word ptr [bp - 0x12]             
  026d  7f1b             jg 0x28a                                 
  026f  8b46f6           mov ax, word ptr [bp - 0xa]              
  0272  03066a12         add ax, word ptr [0x126a]                
  0276  3b46ec           cmp ax, word ptr [bp - 0x14]             
  0279  7c0f             jl 0x28a                                 
  027b  8b46f6           mov ax, word ptr [bp - 0xa]              
  027e  262b4706         sub ax, word ptr es:[bx + 6]             
  0282  3b46ec           cmp ax, word ptr [bp - 0x14]             
  0285  7f03             jg 0x28a                                 
  0287  bf0100           mov di, 1                                
  028a  0bff             or di, di                                
  028c  7405             je 0x293                                 
  028e  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0293  9a0a00680e       lcall 0xe68, 0xa                         -> 0e68:000a
  0298  66833ec55600     cmp dword ptr [0x56c5], 0                
  029e  7435             je 0x2d5                                 
  02a0  f706f0560a00     test word ptr [0x56f0], 0xa              
  02a6  752d             jne 0x2d5                                
  02a8  33f6             xor si, si                               
  02aa  eb20             jmp 0x2cc                                
  02ac  8bde             mov bx, si                               
  02ae  c1e302           shl bx, 2                                
  02b1  66ffb7c556       push dword ptr [bx + 0x56c5]             
  02b6  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  02bb  83c404           add sp, 4                                
  02be  8bde             mov bx, si                               
  02c0  c1e302           shl bx, 2                                
  02c3  8997d756         mov word ptr [bx + 0x56d7], dx           
  02c7  8987d556         mov word ptr [bx + 0x56d5], ax           
  02cb  46               inc si                                   
  02cc  a0ef56           mov al, byte ptr [0x56ef]                
  02cf  b400             mov ah, 0                                
  02d1  3bc6             cmp ax, si                               
  02d3  7fd7             jg 0x2ac                                 
  02d5  66833e4f5600     cmp dword ptr [0x564f], 0                
  02db  7435             je 0x312                                 
  02dd  f7067a560a00     test word ptr [0x567a], 0xa              
  02e3  752d             jne 0x312                                
  02e5  33f6             xor si, si                               
  02e7  eb20             jmp 0x309                                
  02e9  8bde             mov bx, si                               
  02eb  c1e302           shl bx, 2                                
  02ee  66ffb74f56       push dword ptr [bx + 0x564f]             
  02f3  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  02f8  83c404           add sp, 4                                
  02fb  8bde             mov bx, si                               
  02fd  c1e302           shl bx, 2                                
  0300  89976156         mov word ptr [bx + 0x5661], dx           
  0304  89875f56         mov word ptr [bx + 0x565f], ax           
  0308  46               inc si                                   
  0309  a07956           mov al, byte ptr [0x5679]                
  030c  b400             mov ah, 0                                
  030e  3bc6             cmp ax, si                               
  0310  7fd7             jg 0x2e9                                 
  0312  33f6             xor si, si                               
  0314  eb6c             jmp 0x382                                
  0316  56               push si                                  
  0317  9a1800680e       lcall 0xe68, 0x18                        -> 0e68:0018
  031c  59               pop cx                                   
  031d  8b460c           mov ax, word ptr [bp + 0xc]              
  0320  8546f4           test word ptr [bp - 0xc], ax             
  0323  7404             je 0x329                                 
  0325  33c0             xor ax, ax                               
  0327  eb03             jmp 0x32c                                
  0329  b80100           mov ax, 1                                
  032c  c1e002           shl ax, 2                                
  032f  8bd8             mov bx, ax                               
  0331  668b87d556       mov eax, dword ptr [bx + 0x56d5]         
  0336  668946e4         mov dword ptr [bp - 0x1c], eax           
  033a  ff364d56         push word ptr [0x564d]                   
  033e  8b46e4           mov ax, word ptr [bp - 0x1c]             
  0341  0346fa           add ax, word ptr [bp - 6]                
  0344  50               push ax                                  
  0345  66a15f56         mov eax, dword ptr [0x565f]              
  0349  66c1e810         shr eax, 0x10                            
  034d  50               push ax                                  
  034e  666803002800     push 0x280003                            
  0354  ff76f0           push word ptr [bp - 0x10]                
  0357  ff76f2           push word ptr [bp - 0xe]                 
  035a  c41ee734         les bx, ptr [0x34e7]                     
  035e  26ff7708         push word ptr es:[bx + 8]                
  0362  ff36c356         push word ptr [0x56c3]                   
  0366  8b46e4           mov ax, word ptr [bp - 0x1c]             
  0369  0346fa           add ax, word ptr [bp - 6]                
  036c  50               push ax                                  
  036d  668b46e4         mov eax, dword ptr [bp - 0x1c]           
  0371  66c1e810         shr eax, 0x10                            
  0375  50               push ax                                  
  0376  9a5900680e       lcall 0xe68, 0x59                        -> 0e68:0059
  037b  83c416           add sp, 0x16                             
  037e  d166f4           shl word ptr [bp - 0xc], 1               
  0381  46               inc si                                   
  0382  a0ef56           mov al, byte ptr [0x56ef]                
  0385  b400             mov ah, 0                                
  0387  3bc6             cmp ax, si                               
  0389  7f8b             jg 0x316                                 
  038b  66833ec55600     cmp dword ptr [0x56c5], 0                
  0391  7428             je 0x3bb                                 
  0393  f706f0560a00     test word ptr [0x56f0], 0xa              
  0399  7520             jne 0x3bb                                
  039b  33f6             xor si, si                               
  039d  eb13             jmp 0x3b2                                
  039f  8bde             mov bx, si                               
  03a1  c1e302           shl bx, 2                                
  03a4  66ffb7c556       push dword ptr [bx + 0x56c5]             
  03a9  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  03ae  83c404           add sp, 4                                
  03b1  46               inc si                                   
  03b2  a0ef56           mov al, byte ptr [0x56ef]                
  03b5  b400             mov ah, 0                                
  03b7  3bc6             cmp ax, si                               
  03b9  7fe4             jg 0x39f                                 
  03bb  66833e4f5600     cmp dword ptr [0x564f], 0                
  03c1  7428             je 0x3eb                                 
  03c3  f7067a560a00     test word ptr [0x567a], 0xa              
  03c9  7520             jne 0x3eb                                
  03cb  33f6             xor si, si                               
  03cd  eb13             jmp 0x3e2                                
  03cf  8bde             mov bx, si                               
  03d1  c1e302           shl bx, 2                                
  03d4  66ffb74f56       push dword ptr [bx + 0x564f]             
  03d9  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  03de  83c404           add sp, 4                                
  03e1  46               inc si                                   
  03e2  a07956           mov al, byte ptr [0x5679]                
  03e5  b400             mov ah, 0                                
  03e7  3bc6             cmp ax, si                               
  03e9  7fe4             jg 0x3cf                                 
  03eb  0bff             or di, di                                
  03ed  7405             je 0x3f4                                 
  03ef  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  03f4  5f               pop di                                   
  03f5  5e               pop si                                   
  03f6  c9               leave                                    
  03f7  cb               retf                                     

res_077b_03f8:  ; ENTRY
  03f8  55               push bp                                  
  03f9  8bec             mov bp, sp                               
  03fb  8b5606           mov dx, word ptr [bp + 6]                
  03fe  8b5e08           mov bx, word ptr [bp + 8]                
  0401  b8042c           mov ax, 0x2c04                           
  0404  8ec0             mov es, ax                               
  0406  2639167701       cmp word ptr es:[0x177], dx              
  040b  7f1b             jg 0x428                                 
  040d  8ec0             mov es, ax                               
  040f  2639167b01       cmp word ptr es:[0x17b], dx              
  0414  7c12             jl 0x428                                 
  0416  8ec0             mov es, ax                               
  0418  26391e7501       cmp word ptr es:[0x175], bx              
  041d  7f09             jg 0x428                                 
  041f  8ec0             mov es, ax                               
  0421  26391e7901       cmp word ptr es:[0x179], bx              
  0426  7d04             jge 0x42c                                
  0428  33c0             xor ax, ax                               
  042a  eb03             jmp 0x42f                                
  042c  b80100           mov ax, 1                                
  042f  5d               pop bp                                   
  0430  cb               retf                                     
  0431  55               push bp                                  
