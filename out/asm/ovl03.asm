; ovl03 stub 2f67 file_off 0x3eb30 size 0x1270

ovl03_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  6a00             push 0                                   
  0005  90               nop                                      
  0006  0e               push cs                                  
  0007  e87d00           call 0x87                                
  000a  59               pop cx                                   
  000b  6a01             push 1                                   
  000d  90               nop                                      
  000e  0e               push cs                                  
  000f  e87500           call 0x87                                
  0012  59               pop cx                                   
  0013  6a02             push 2                                   
  0015  90               nop                                      
  0016  0e               push cs                                  
  0017  e86d00           call 0x87                                
  001a  59               pop cx                                   
  001b  6a03             push 3                                   
  001d  90               nop                                      
  001e  0e               push cs                                  
  001f  e86500           call 0x87                                
  0022  59               pop cx                                   
  0023  90               nop                                      
  0024  0e               push cs                                  
  0025  e8de01           call 0x206                               
  0028  6a00             push 0                                   
  002a  90               nop                                      
  002b  0e               push cs                                  
  002c  e8ca02           call 0x2f9                               
  002f  59               pop cx                                   
  0030  6a01             push 1                                   
  0032  90               nop                                      
  0033  0e               push cs                                  
  0034  e8c202           call 0x2f9                               
  0037  59               pop cx                                   
  0038  6a02             push 2                                   
  003a  90               nop                                      
  003b  0e               push cs                                  
  003c  e8ba02           call 0x2f9                               
  003f  59               pop cx                                   
  0040  6a03             push 3                                   
  0042  90               nop                                      
  0043  0e               push cs                                  
  0044  e8b202           call 0x2f9                               
  0047  59               pop cx                                   
  0048  90               nop                                      
  0049  0e               push cs                                  
  004a  e87a05           call 0x5c7                               
  004d  90               nop                                      
  004e  0e               push cs                                  
  004f  e81508           call 0x867                               
  0052  90               nop                                      
  0053  0e               push cs                                  
  0054  e8900c           call 0xce7                               
  0057  666a64           push 0x64                                
  005a  6a01             push 1                                   
  005c  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0061  83c406           add sp, 6                                
  0064  3d3200           cmp ax, 0x32                             
  0067  7d17             jge 0x80                                 
  0069  66680300ffff     push 0xffff0003                          
  006f  6a01             push 1                                   
  0071  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0076  83c406           add sp, 6                                
  0079  50               push ax                                  
  007a  90               nop                                      
  007b  0e               push cs                                  
  007c  e82b0d           call 0xdaa                               
  007f  59               pop cx                                   
  0080  90               nop                                      
  0081  0e               push cs                                  
  0082  e8620c           call 0xce7                               
  0085  5d               pop bp                                   
  0086  cb               retf                                     

ovl03_0087:  ; ENTRY
  0087  55               push bp                                  
  0088  8bec             mov bp, sp                               
  008a  83ec04           sub sp, 4                                
  008d  56               push si                                  
  008e  57               push di                                  
  008f  8b7606           mov si, word ptr [bp + 6]                
  0092  8bc6             mov ax, si                               
  0094  40               inc ax                                   
  0095  bb0400           mov bx, 4                                
  0098  99               cdq                                      
  0099  f7fb             idiv bx                                  
  009b  8bfa             mov di, dx                               
  009d  8bc6             mov ax, si                               
  009f  d1e0             shl ax, 1                                
  00a1  c41e8a3f         les bx, ptr [0x3f8a]                     
  00a5  03d8             add bx, ax                               
  00a7  26837f2c02       cmp word ptr es:[bx + 0x2c], 2           
  00ac  7f47             jg 0xf5                                  
  00ae  8bc6             mov ax, si                               
  00b0  c1e003           shl ax, 3                                
  00b3  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  00b7  03d8             add bx, ax                               
  00b9  66268b878c00     mov eax, dword ptr es:[bx + 0x8c]        
  00bf  8bd6             mov dx, si                               
  00c1  c1e202           shl dx, 2                                
  00c4  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  00c8  03da             add bx, dx                               
  00ca  662689874402     mov dword ptr es:[bx + 0x244], eax       
  00d0  8bc6             mov ax, si                               
  00d2  c1e003           shl ax, 3                                
  00d5  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  00d9  03d8             add bx, ax                               
  00db  66268b879000     mov eax, dword ptr es:[bx + 0x90]        
  00e1  8bd6             mov dx, si                               
  00e3  c1e202           shl dx, 2                                
  00e6  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  00ea  03da             add bx, dx                               
  00ec  662689875402     mov dword ptr es:[bx + 0x254], eax       
  00f2  e90d01           jmp 0x202                                
  00f5  8bc6             mov ax, si                               
  00f7  c1e003           shl ax, 3                                
  00fa  c41e8a3f         les bx, ptr [0x3f8a]                     
  00fe  03d8             add bx, ax                               
  0100  66268b878c00     mov eax, dword ptr es:[bx + 0x8c]        
  0106  668946fc         mov dword ptr [bp - 4], eax              
  010a  8bc6             mov ax, si                               
  010c  c1e002           shl ax, 2                                
  010f  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0113  03d8             add bx, ax                               
  0115  268b87ac00       mov ax, word ptr es:[bx + 0xac]          
  011a  f7d8             neg ax                                   
  011c  6bc00a           imul ax, ax, 0xa                         
  011f  0146fc           add word ptr [bp - 4], ax                
  0122  268b87ae00       mov ax, word ptr es:[bx + 0xae]          
  0127  f7d8             neg ax                                   
  0129  6bc00a           imul ax, ax, 0xa                         
  012c  0146fe           add word ptr [bp - 2], ax                
  012f  666810000100     push 0x10010                             
  0135  16               push ss                                  
  0136  8d46fe           lea ax, [bp - 2]                         
  0139  50               push ax                                  
  013a  16               push ss                                  
  013b  8d46fc           lea ax, [bp - 4]                         
  013e  50               push ax                                  
  013f  9a3e00622f       lcall 0x2f62, 0x3e                       -> ovl02:04ae
  0144  83c40c           add sp, 0xc                              
  0147  8b46fe           mov ax, word ptr [bp - 2]                
  014a  6bc070           imul ax, ax, 0x70                        
  014d  c41e8a3f         les bx, ptr [0x3f8a]                     
  0151  03d8             add bx, ax                               
  0153  035efc           add bx, word ptr [bp - 4]                
  0156  26c687206107     mov byte ptr es:[bx + 0x6120], 7         
  015c  66ff76fc         push dword ptr [bp - 4]                  
  0160  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0165  83c404           add sp, 4                                
  0168  8bc6             mov ax, si                               
  016a  c1e002           shl ax, 2                                
  016d  c41e8a3f         les bx, ptr [0x3f8a]                     
  0171  03d8             add bx, ax                               
  0173  668b46fc         mov eax, dword ptr [bp - 4]              
  0177  662689874402     mov dword ptr es:[bx + 0x244], eax       
  017d  8bc6             mov ax, si                               
  017f  c1e003           shl ax, 3                                
  0182  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0186  03d8             add bx, ax                               
  0188  66268b879000     mov eax, dword ptr es:[bx + 0x90]        
  018e  668946fc         mov dword ptr [bp - 4], eax              
  0192  8bc7             mov ax, di                               
  0194  c1e002           shl ax, 2                                
  0197  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  019b  03d8             add bx, ax                               
  019d  268b87ac00       mov ax, word ptr es:[bx + 0xac]          
  01a2  f7d8             neg ax                                   
  01a4  6bc00a           imul ax, ax, 0xa                         
  01a7  0146fc           add word ptr [bp - 4], ax                
  01aa  268b87ae00       mov ax, word ptr es:[bx + 0xae]          
  01af  f7d8             neg ax                                   
  01b1  6bc00a           imul ax, ax, 0xa                         
  01b4  0146fe           add word ptr [bp - 2], ax                
  01b7  666810000100     push 0x10010                             
  01bd  16               push ss                                  
  01be  8d46fe           lea ax, [bp - 2]                         
  01c1  50               push ax                                  
  01c2  16               push ss                                  
  01c3  8d46fc           lea ax, [bp - 4]                         
  01c6  50               push ax                                  
  01c7  9a3e00622f       lcall 0x2f62, 0x3e                       -> ovl02:04ae
  01cc  83c40c           add sp, 0xc                              
  01cf  8b46fe           mov ax, word ptr [bp - 2]                
  01d2  6bc070           imul ax, ax, 0x70                        
  01d5  c41e8a3f         les bx, ptr [0x3f8a]                     
  01d9  03d8             add bx, ax                               
  01db  035efc           add bx, word ptr [bp - 4]                
  01de  26c687206107     mov byte ptr es:[bx + 0x6120], 7         
  01e4  66ff76fc         push dword ptr [bp - 4]                  
  01e8  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  01ed  83c404           add sp, 4                                
  01f0  8bc6             mov ax, si                               
  01f2  c1e002           shl ax, 2                                
  01f5  c41e8a3f         les bx, ptr [0x3f8a]                     
  01f9  03d8             add bx, ax                               
  01fb  668b46fc         mov eax, dword ptr [bp - 4]              
  01ff  e9eafe           jmp 0xec                                 
  0202  5f               pop di                                   
  0203  5e               pop si                                   
  0204  c9               leave                                    
  0205  cb               retf                                     

ovl03_0206:  ; ENTRY
  0206  55               push bp                                  
  0207  8bec             mov bp, sp                               
  0209  83ec12           sub sp, 0x12                             
  020c  56               push si                                  
  020d  57               push di                                  
  020e  c746f03800       mov word ptr [bp - 0x10], 0x38           
  0213  c746f24e00       mov word ptr [bp - 0xe], 0x4e            
  0218  33c9             xor cx, cx                               
  021a  e9d000           jmp 0x2ed                                
  021d  8bf1             mov si, cx                               
  021f  8bc1             mov ax, cx                               
  0221  40               inc ax                                   
  0222  bb0400           mov bx, 4                                
  0225  99               cdq                                      
  0226  f7fb             idiv bx                                  
  0228  8bfa             mov di, dx                               
  022a  8bc6             mov ax, si                               
  022c  c1e002           shl ax, 2                                
  022f  c41e8a3f         les bx, ptr [0x3f8a]                     
  0233  03d8             add bx, ax                               
  0235  8b46f0           mov ax, word ptr [bp - 0x10]             
  0238  262b875402       sub ax, word ptr es:[bx + 0x254]         
  023d  8946ee           mov word ptr [bp - 0x12], ax             
  0240  cd3b             int 0x3b                                 
  0242  46               inc si                                   
  0243  ee               out dx, al                               
  0244  8b46f2           mov ax, word ptr [bp - 0xe]              
  0247  262b875602       sub ax, word ptr es:[bx + 0x256]         
  024c  8946ee           mov word ptr [bp - 0x12], ax             
  024f  cd3b             int 0x3b                                 
  0251  46               inc si                                   
  0252  ee               out dx, al                               
  0253  cd3a             int 0x3a                                 
  0255  f9               stc                                      
  0256  cd35             int 0x35                                 
  0258  5e               pop si                                   
  0259  fc               cld                                      
  025a  8bc7             mov ax, di                               
  025c  c1e002           shl ax, 2                                
  025f  cd3d             int 0x3d                                 
  0261  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0265  03d8             add bx, ax                               
  0267  8b46f0           mov ax, word ptr [bp - 0x10]             
  026a  262b874402       sub ax, word ptr es:[bx + 0x244]         
  026f  8946ee           mov word ptr [bp - 0x12], ax             
  0272  cd3b             int 0x3b                                 
  0274  46               inc si                                   
  0275  ee               out dx, al                               
  0276  8b46f2           mov ax, word ptr [bp - 0xe]              
  0279  262b874602       sub ax, word ptr es:[bx + 0x246]         
  027e  8946ee           mov word ptr [bp - 0x12], ax             
  0281  cd3b             int 0x3b                                 
  0283  46               inc si                                   
  0284  ee               out dx, al                               
  0285  cd3a             int 0x3a                                 
  0287  f9               stc                                      
  0288  cd35             int 0x35                                 
  028a  5e               pop si                                   
  028b  f8               clc                                      
  028c  cd35             int 0x35                                 
  028e  46               inc si                                   
  028f  f8               clc                                      
  0290  cd34             int 0x34                                 
  0292  5e               pop si                                   
  0293  fc               cld                                      
  0294  cd39             int 0x39                                 
  0296  7eee             jle 0x286                                
  0298  cd3d             int 0x3d                                 
  029a  8b46ee           mov ax, word ptr [bp - 0x12]             
  029d  9e               sahf                                     
  029e  764c             jbe 0x2ec                                
  02a0  8bc6             mov ax, si                               
  02a2  c1e002           shl ax, 2                                
  02a5  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  02a9  03d8             add bx, ax                               
  02ab  66268b875402     mov eax, dword ptr es:[bx + 0x254]       
  02b1  668946f4         mov dword ptr [bp - 0xc], eax            
  02b5  8bc7             mov ax, di                               
  02b7  c1e002           shl ax, 2                                
  02ba  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  02be  03d8             add bx, ax                               
  02c0  66268b874402     mov eax, dword ptr es:[bx + 0x244]       
  02c6  8bd6             mov dx, si                               
  02c8  c1e202           shl dx, 2                                
  02cb  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  02cf  03da             add bx, dx                               
  02d1  662689875402     mov dword ptr es:[bx + 0x254], eax       
  02d7  8bc7             mov ax, di                               
  02d9  c1e002           shl ax, 2                                
  02dc  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  02e0  03d8             add bx, ax                               
  02e2  668b46f4         mov eax, dword ptr [bp - 0xc]            
  02e6  662689874402     mov dword ptr es:[bx + 0x244], eax       
  02ec  41               inc cx                                   
  02ed  83f904           cmp cx, 4                                
  02f0  7d03             jge 0x2f5                                
  02f2  e928ff           jmp 0x21d                                
  02f5  5f               pop di                                   
  02f6  5e               pop si                                   
  02f7  c9               leave                                    
  02f8  cb               retf                                     

ovl03_02f9:  ; ENTRY
  02f9  55               push bp                                  
  02fa  8bec             mov bp, sp                               
  02fc  83ec0e           sub sp, 0xe                              
  02ff  56               push si                                  
  0300  57               push di                                  
  0301  8b7e06           mov di, word ptr [bp + 6]                
  0304  c746f80000       mov word ptr [bp - 8], 0                 
  0309  c746f60000       mov word ptr [bp - 0xa], 0               
  030e  8bc7             mov ax, di                               
  0310  6bc050           imul ax, ax, 0x50                        
  0313  c41e8a3f         les bx, ptr [0x3f8a]                     
  0317  03d8             add bx, ax                               
  0319  8b46f8           mov ax, word ptr [bp - 8]                
  031c  c1e002           shl ax, 2                                
  031f  03d8             add bx, ax                               
  0321  8bc7             mov ax, di                               
  0323  c1e002           shl ax, 2                                
  0326  06               push es                                  
  0327  8b368a3f         mov si, word ptr [0x3f8a]                
  032b  03f0             add si, ax                               
  032d  66268b844402     mov eax, dword ptr es:[si + 0x244]       
  0333  07               pop es                                   
  0334  662689870401     mov dword ptr es:[bx + 0x104], eax       
  033a  8bc7             mov ax, di                               
  033c  d1e0             shl ax, 1                                
  033e  c41e8a3f         les bx, ptr [0x3f8a]                     
  0342  03d8             add bx, ax                               
  0344  26c787fc000100   mov word ptr es:[bx + 0xfc], 1           
  034b  26837f2c02       cmp word ptr es:[bx + 0x2c], 2           
  0350  7f34             jg 0x386                                 
  0352  8bc7             mov ax, di                               
  0354  d1e0             shl ax, 1                                
  0356  c41e8a3f         les bx, ptr [0x3f8a]                     
  035a  03d8             add bx, ax                               
  035c  26ff87fc00       inc word ptr es:[bx + 0xfc]              
  0361  8bc7             mov ax, di                               
  0363  c1e002           shl ax, 2                                
  0366  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  036a  03d8             add bx, ax                               
  036c  66268b875402     mov eax, dword ptr es:[bx + 0x254]       
  0372  8bd7             mov dx, di                               
  0374  6bd250           imul dx, dx, 0x50                        
  0377  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  037b  03da             add bx, dx                               
  037d  662689870801     mov dword ptr es:[bx + 0x108], eax       
  0383  e93d02           jmp 0x5c3                                
  0386  8bc7             mov ax, di                               
  0388  c1e002           shl ax, 2                                
  038b  c41e8a3f         les bx, ptr [0x3f8a]                     
  038f  03d8             add bx, ax                               
  0391  2683bf440200     cmp word ptr es:[bx + 0x244], 0          
  0397  7419             je 0x3b2                                 
  0399  2683bf460200     cmp word ptr es:[bx + 0x246], 0          
  039f  7411             je 0x3b2                                 
  03a1  2683bf44026f     cmp word ptr es:[bx + 0x244], 0x6f       
  03a7  7409             je 0x3b2                                 
  03a9  2681bf46029b00   cmp word ptr es:[bx + 0x246], 0x9b       
  03b0  7532             jne 0x3e4                                
  03b2  8bc7             mov ax, di                               
  03b4  c1e002           shl ax, 2                                
  03b7  c41e8a3f         les bx, ptr [0x3f8a]                     
  03bb  03d8             add bx, ax                               
  03bd  2683bf540200     cmp word ptr es:[bx + 0x254], 0          
  03c3  748d             je 0x352                                 
  03c5  2683bf560200     cmp word ptr es:[bx + 0x256], 0          
  03cb  7485             je 0x352                                 
  03cd  2683bf54026f     cmp word ptr es:[bx + 0x254], 0x6f       
  03d3  7503             jne 0x3d8                                
  03d5  e97aff           jmp 0x352                                
  03d8  2681bf56029b00   cmp word ptr es:[bx + 0x256], 0x9b       
  03df  7503             jne 0x3e4                                
  03e1  e96eff           jmp 0x352                                
  03e4  8bc7             mov ax, di                               
  03e6  c1e002           shl ax, 2                                
  03e9  c41e8a3f         les bx, ptr [0x3f8a]                     
  03ed  03d8             add bx, ax                               
  03ef  6626ffb74402     push dword ptr es:[bx + 0x244]           
  03f5  6626ffb75402     push dword ptr es:[bx + 0x254]           
  03fb  90               nop                                      
  03fc  0e               push cs                                  
  03fd  e8ed0b           call 0xfed                               
  0400  83c408           add sp, 8                                
  0403  8946fa           mov word ptr [bp - 6], ax                
  0406  8bc7             mov ax, di                               
  0408  d1e0             shl ax, 1                                
  040a  c41e8a3f         les bx, ptr [0x3f8a]                     
  040e  03d8             add bx, ax                               
  0410  268b5f2c         mov bx, word ptr es:[bx + 0x2c]          
  0414  4b               dec bx                                   
  0415  8b46fa           mov ax, word ptr [bp - 6]                
  0418  99               cdq                                      
  0419  f7fb             idiv bx                                  
  041b  8946fa           mov word ptr [bp - 6], ax                
  041e  e95b01           jmp 0x57c                                
  0421  16               push ss                                  
  0422  8d46fc           lea ax, [bp - 4]                         
  0425  50               push ax                                  
  0426  8bc7             mov ax, di                               
  0428  c1e002           shl ax, 2                                
  042b  c41e8a3f         les bx, ptr [0x3f8a]                     
  042f  03d8             add bx, ax                               
  0431  6626ffb75402     push dword ptr es:[bx + 0x254]           
  0437  8bc7             mov ax, di                               
  0439  6bc050           imul ax, ax, 0x50                        
  043c  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0440  03d8             add bx, ax                               
  0442  8b46f8           mov ax, word ptr [bp - 8]                
  0445  c1e002           shl ax, 2                                
  0448  03d8             add bx, ax                               
  044a  6626ffb70401     push dword ptr es:[bx + 0x104]           
  0450  90               nop                                      
  0451  0e               push cs                                  
  0452  e87b09           call 0xdd0                               
  0455  83c40c           add sp, 0xc                              
  0458  8bc7             mov ax, di                               
  045a  6bc050           imul ax, ax, 0x50                        
  045d  c41e8a3f         les bx, ptr [0x3f8a]                     
  0461  03d8             add bx, ax                               
  0463  8b46f8           mov ax, word ptr [bp - 8]                
  0466  c1e002           shl ax, 2                                
  0469  03d8             add bx, ax                               
  046b  268b870401       mov ax, word ptr es:[bx + 0x104]         
  0470  50               push ax                                  
  0471  8b46fc           mov ax, word ptr [bp - 4]                
  0474  f76efa           imul word ptr [bp - 6]                   
  0477  5a               pop dx                                   
  0478  03d0             add dx, ax                               
  047a  8956f4           mov word ptr [bp - 0xc], dx              
  047d  8bc7             mov ax, di                               
  047f  6bc050           imul ax, ax, 0x50                        
  0482  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0486  03d8             add bx, ax                               
  0488  8b46f8           mov ax, word ptr [bp - 8]                
  048b  c1e002           shl ax, 2                                
  048e  03d8             add bx, ax                               
  0490  268b870601       mov ax, word ptr es:[bx + 0x106]         
  0495  50               push ax                                  
  0496  8b46fe           mov ax, word ptr [bp - 2]                
  0499  f76efa           imul word ptr [bp - 6]                   
  049c  5a               pop dx                                   
  049d  03d0             add dx, ax                               
  049f  8956f2           mov word ptr [bp - 0xe], dx              
  04a2  6a00             push 0                                   
  04a4  8b46fa           mov ax, word ptr [bp - 6]                
  04a7  99               cdq                                      
  04a8  2bc2             sub ax, dx                               
  04aa  d1f8             sar ax, 1                                
  04ac  50               push ax                                  
  04ad  16               push ss                                  
  04ae  8d46f2           lea ax, [bp - 0xe]                       
  04b1  50               push ax                                  
  04b2  16               push ss                                  
  04b3  8d46f4           lea ax, [bp - 0xc]                       
  04b6  50               push ax                                  
  04b7  9a3e00622f       lcall 0x2f62, 0x3e                       -> ovl02:04ae
  04bc  83c40c           add sp, 0xc                              
  04bf  ff46f8           inc word ptr [bp - 8]                    
  04c2  8b46f2           mov ax, word ptr [bp - 0xe]              
  04c5  6bc070           imul ax, ax, 0x70                        
  04c8  c41e8a3f         les bx, ptr [0x3f8a]                     
  04cc  03d8             add bx, ax                               
  04ce  035ef4           add bx, word ptr [bp - 0xc]              
  04d1  26c687206107     mov byte ptr es:[bx + 0x6120], 7         
  04d7  ff76f2           push word ptr [bp - 0xe]                 
  04da  ff76f4           push word ptr [bp - 0xc]                 
  04dd  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  04e2  83c404           add sp, 4                                
  04e5  ff76f2           push word ptr [bp - 0xe]                 
  04e8  ff76f4           push word ptr [bp - 0xc]                 
  04eb  8bc7             mov ax, di                               
  04ed  6bc050           imul ax, ax, 0x50                        
  04f0  8b168a3f         mov dx, word ptr [0x3f8a]                
  04f4  03d0             add dx, ax                               
  04f6  8b46f8           mov ax, word ptr [bp - 8]                
  04f9  c1e002           shl ax, 2                                
  04fc  03d0             add dx, ax                               
  04fe  81c20401         add dx, 0x104                            
  0502  ff368c3f         push word ptr [0x3f8c]                   
  0506  52               push dx                                  
  0507  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  050c  83c408           add sp, 8                                
  050f  8bc7             mov ax, di                               
  0511  d1e0             shl ax, 1                                
  0513  c41e8a3f         les bx, ptr [0x3f8a]                     
  0517  03d8             add bx, ax                               
  0519  26ff87fc00       inc word ptr es:[bx + 0xfc]              
  051e  8bc7             mov ax, di                               
  0520  6bc050           imul ax, ax, 0x50                        
  0523  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0527  03d8             add bx, ax                               
  0529  8b46f8           mov ax, word ptr [bp - 8]                
  052c  c1e002           shl ax, 2                                
  052f  03d8             add bx, ax                               
  0531  6626ffb70401     push dword ptr es:[bx + 0x104]           
  0537  8bc7             mov ax, di                               
  0539  c1e002           shl ax, 2                                
  053c  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0540  03d8             add bx, ax                               
  0542  6626ffb75402     push dword ptr es:[bx + 0x254]           
  0548  90               nop                                      
  0549  0e               push cs                                  
  054a  e8a00a           call 0xfed                               
  054d  83c408           add sp, 8                                
  0550  3b46fa           cmp ax, word ptr [bp - 6]                
  0553  7c22             jl 0x577                                 
  0555  8bc7             mov ax, di                               
  0557  d1e0             shl ax, 1                                
  0559  c41e8a3f         les bx, ptr [0x3f8a]                     
  055d  03d8             add bx, ax                               
  055f  8bc7             mov ax, di                               
  0561  d1e0             shl ax, 1                                
  0563  06               push es                                  
  0564  8b368a3f         mov si, word ptr [0x3f8a]                
  0568  03f0             add si, ax                               
  056a  268b442c         mov ax, word ptr es:[si + 0x2c]          
  056e  48               dec ax                                   
  056f  07               pop es                                   
  0570  263987fc00       cmp word ptr es:[bx + 0xfc], ax          
  0575  7c05             jl 0x57c                                 
  0577  c746f60100       mov word ptr [bp - 0xa], 1               
  057c  837ef600         cmp word ptr [bp - 0xa], 0               
  0580  7503             jne 0x585                                
  0582  e99cfe           jmp 0x421                                
  0585  ff46f8           inc word ptr [bp - 8]                    
  0588  8bc7             mov ax, di                               
  058a  6bc050           imul ax, ax, 0x50                        
  058d  c41e8a3f         les bx, ptr [0x3f8a]                     
  0591  03d8             add bx, ax                               
  0593  8b46f8           mov ax, word ptr [bp - 8]                
  0596  c1e002           shl ax, 2                                
  0599  03d8             add bx, ax                               
  059b  8bc7             mov ax, di                               
  059d  c1e002           shl ax, 2                                
  05a0  06               push es                                  
  05a1  8b368a3f         mov si, word ptr [0x3f8a]                
  05a5  03f0             add si, ax                               
  05a7  66268b845402     mov eax, dword ptr es:[si + 0x254]       
  05ad  07               pop es                                   
  05ae  662689870401     mov dword ptr es:[bx + 0x104], eax       
  05b4  8bc7             mov ax, di                               
  05b6  d1e0             shl ax, 1                                
  05b8  c41e8a3f         les bx, ptr [0x3f8a]                     
  05bc  03d8             add bx, ax                               
  05be  26ff87fc00       inc word ptr es:[bx + 0xfc]              
  05c3  5f               pop di                                   
  05c4  5e               pop si                                   
  05c5  c9               leave                                    
  05c6  cb               retf                                     

ovl03_05c7:  ; ENTRY
  05c7  55               push bp                                  
  05c8  8bec             mov bp, sp                               
  05ca  56               push si                                  
  05cb  57               push di                                  
  05cc  33f6             xor si, si                               
  05ce  e98a02           jmp 0x85b                                
  05d1  33ff             xor di, di                               
  05d3  e94b01           jmp 0x721                                
  05d6  8bc6             mov ax, si                               
  05d8  6bc050           imul ax, ax, 0x50                        
  05db  c41e8a3f         les bx, ptr [0x3f8a]                     
  05df  03d8             add bx, ax                               
  05e1  8bc7             mov ax, di                               
  05e3  c1e002           shl ax, 2                                
  05e6  03d8             add bx, ax                               
  05e8  2683bf040100     cmp word ptr es:[bx + 0x104], 0          
  05ee  7452             je 0x642                                 
  05f0  8bc6             mov ax, si                               
  05f2  6bc050           imul ax, ax, 0x50                        
  05f5  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  05f9  03d8             add bx, ax                               
  05fb  8bc7             mov ax, di                               
  05fd  c1e002           shl ax, 2                                
  0600  03d8             add bx, ax                               
  0602  2683bf060100     cmp word ptr es:[bx + 0x106], 0          
  0608  7438             je 0x642                                 
  060a  8bc6             mov ax, si                               
  060c  6bc050           imul ax, ax, 0x50                        
  060f  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0613  03d8             add bx, ax                               
  0615  8bc7             mov ax, di                               
  0617  c1e002           shl ax, 2                                
  061a  03d8             add bx, ax                               
  061c  2683bf04016f     cmp word ptr es:[bx + 0x104], 0x6f       
  0622  741e             je 0x642                                 
  0624  8bc6             mov ax, si                               
  0626  6bc050           imul ax, ax, 0x50                        
  0629  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  062d  03d8             add bx, ax                               
  062f  8bc7             mov ax, di                               
  0631  c1e002           shl ax, 2                                
  0634  03d8             add bx, ax                               
  0636  2681bf06019b00   cmp word ptr es:[bx + 0x106], 0x9b       
  063d  7403             je 0x642                                 
  063f  e9a500           jmp 0x6e7                                
  0642  8bc6             mov ax, si                               
  0644  6bc050           imul ax, ax, 0x50                        
  0647  c41e8a3f         les bx, ptr [0x3f8a]                     
  064b  03d8             add bx, ax                               
  064d  8bc7             mov ax, di                               
  064f  40               inc ax                                   
  0650  c1e002           shl ax, 2                                
  0653  03d8             add bx, ax                               
  0655  2683bf040100     cmp word ptr es:[bx + 0x104], 0          
  065b  7452             je 0x6af                                 
  065d  8bc6             mov ax, si                               
  065f  6bc050           imul ax, ax, 0x50                        
  0662  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0666  03d8             add bx, ax                               
  0668  8bc7             mov ax, di                               
  066a  40               inc ax                                   
  066b  c1e002           shl ax, 2                                
  066e  03d8             add bx, ax                               
  0670  2683bf060100     cmp word ptr es:[bx + 0x106], 0          
  0676  7437             je 0x6af                                 
  0678  8bc6             mov ax, si                               
  067a  6bc050           imul ax, ax, 0x50                        
  067d  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0681  03d8             add bx, ax                               
  0683  8bc7             mov ax, di                               
  0685  40               inc ax                                   
  0686  c1e002           shl ax, 2                                
  0689  03d8             add bx, ax                               
  068b  2683bf04016f     cmp word ptr es:[bx + 0x104], 0x6f       
  0691  741c             je 0x6af                                 
  0693  8bc6             mov ax, si                               
  0695  6bc050           imul ax, ax, 0x50                        
  0698  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  069c  03d8             add bx, ax                               
  069e  8bc7             mov ax, di                               
  06a0  40               inc ax                                   
  06a1  c1e002           shl ax, 2                                
  06a4  03d8             add bx, ax                               
  06a6  2681bf06019b00   cmp word ptr es:[bx + 0x106], 0x9b       
  06ad  7538             jne 0x6e7                                
  06af  8bc6             mov ax, si                               
  06b1  6bc050           imul ax, ax, 0x50                        
  06b4  c41e8a3f         les bx, ptr [0x3f8a]                     
  06b8  03d8             add bx, ax                               
  06ba  8bc7             mov ax, di                               
  06bc  40               inc ax                                   
  06bd  c1e002           shl ax, 2                                
  06c0  03d8             add bx, ax                               
  06c2  6626ffb70401     push dword ptr es:[bx + 0x104]           
  06c8  8bc6             mov ax, si                               
  06ca  6bc050           imul ax, ax, 0x50                        
  06cd  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  06d1  03d8             add bx, ax                               
  06d3  8bc7             mov ax, di                               
  06d5  c1e002           shl ax, 2                                
  06d8  03d8             add bx, ax                               
  06da  6626ffb70401     push dword ptr es:[bx + 0x104]           
  06e0  90               nop                                      
  06e1  0e               push cs                                  
  06e2  e82904           call 0xb0e                               
  06e5  eb36             jmp 0x71d                                
  06e7  8bc6             mov ax, si                               
  06e9  6bc050           imul ax, ax, 0x50                        
  06ec  c41e8a3f         les bx, ptr [0x3f8a]                     
  06f0  03d8             add bx, ax                               
  06f2  8bc7             mov ax, di                               
  06f4  40               inc ax                                   
  06f5  c1e002           shl ax, 2                                
  06f8  03d8             add bx, ax                               
  06fa  6626ffb70401     push dword ptr es:[bx + 0x104]           
  0700  8bc6             mov ax, si                               
  0702  6bc050           imul ax, ax, 0x50                        
  0705  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0709  03d8             add bx, ax                               
  070b  8bc7             mov ax, di                               
  070d  c1e002           shl ax, 2                                
  0710  03d8             add bx, ax                               
  0712  6626ffb70401     push dword ptr es:[bx + 0x104]           
  0718  90               nop                                      
  0719  0e               push cs                                  
  071a  e8f102           call 0xa0e                               
  071d  83c408           add sp, 8                                
  0720  47               inc di                                   
  0721  8bc6             mov ax, si                               
  0723  d1e0             shl ax, 1                                
  0725  c41e8a3f         les bx, ptr [0x3f8a]                     
  0729  03d8             add bx, ax                               
  072b  268b87fc00       mov ax, word ptr es:[bx + 0xfc]          
  0730  48               dec ax                                   
  0731  3bc7             cmp ax, di                               
  0733  7e03             jle 0x738                                
  0735  e99efe           jmp 0x5d6                                
  0738  8bc6             mov ax, si                               
  073a  40               inc ax                                   
  073b  bb0400           mov bx, 4                                
  073e  99               cdq                                      
  073f  f7fb             idiv bx                                  
  0741  8bca             mov cx, dx                               
  0743  8bc6             mov ax, si                               
  0745  6bc050           imul ax, ax, 0x50                        
  0748  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  074c  03d8             add bx, ax                               
  074e  8bc7             mov ax, di                               
  0750  c1e002           shl ax, 2                                
  0753  03d8             add bx, ax                               
  0755  2683bf040100     cmp word ptr es:[bx + 0x104], 0          
  075b  744f             je 0x7ac                                 
  075d  8bc6             mov ax, si                               
  075f  6bc050           imul ax, ax, 0x50                        
  0762  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0766  03d8             add bx, ax                               
  0768  8bc7             mov ax, di                               
  076a  c1e002           shl ax, 2                                
  076d  03d8             add bx, ax                               
  076f  2683bf060100     cmp word ptr es:[bx + 0x106], 0          
  0775  7435             je 0x7ac                                 
  0777  8bc6             mov ax, si                               
  0779  6bc050           imul ax, ax, 0x50                        
  077c  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0780  03d8             add bx, ax                               
  0782  8bc7             mov ax, di                               
  0784  c1e002           shl ax, 2                                
  0787  03d8             add bx, ax                               
  0789  2683bf04016f     cmp word ptr es:[bx + 0x104], 0x6f       
  078f  741b             je 0x7ac                                 
  0791  8bc6             mov ax, si                               
  0793  6bc050           imul ax, ax, 0x50                        
  0796  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  079a  03d8             add bx, ax                               
  079c  8bc7             mov ax, di                               
  079e  c1e002           shl ax, 2                                
  07a1  03d8             add bx, ax                               
  07a3  2681bf06019b00   cmp word ptr es:[bx + 0x106], 0x9b       
  07aa  757d             jne 0x829                                
  07ac  8bc1             mov ax, cx                               
  07ae  6bc050           imul ax, ax, 0x50                        
  07b1  c41e8a3f         les bx, ptr [0x3f8a]                     
  07b5  03d8             add bx, ax                               
  07b7  2683bf040100     cmp word ptr es:[bx + 0x104], 0          
  07bd  743a             je 0x7f9                                 
  07bf  8bc1             mov ax, cx                               
  07c1  6bc050           imul ax, ax, 0x50                        
  07c4  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  07c8  03d8             add bx, ax                               
  07ca  2683bf060100     cmp word ptr es:[bx + 0x106], 0          
  07d0  7427             je 0x7f9                                 
  07d2  8bc1             mov ax, cx                               
  07d4  6bc050           imul ax, ax, 0x50                        
  07d7  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  07db  03d8             add bx, ax                               
  07dd  2683bf04016f     cmp word ptr es:[bx + 0x104], 0x6f       
  07e3  7414             je 0x7f9                                 
  07e5  8bc1             mov ax, cx                               
  07e7  6bc050           imul ax, ax, 0x50                        
  07ea  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  07ee  03d8             add bx, ax                               
  07f0  2681bf06019b00   cmp word ptr es:[bx + 0x106], 0x9b       
  07f7  7530             jne 0x829                                
  07f9  8bc1             mov ax, cx                               
  07fb  6bc050           imul ax, ax, 0x50                        
  07fe  c41e8a3f         les bx, ptr [0x3f8a]                     
  0802  03d8             add bx, ax                               
  0804  6626ffb70401     push dword ptr es:[bx + 0x104]           
  080a  8bc6             mov ax, si                               
  080c  6bc050           imul ax, ax, 0x50                        
  080f  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0813  03d8             add bx, ax                               
  0815  8bc7             mov ax, di                               
  0817  c1e002           shl ax, 2                                
  081a  03d8             add bx, ax                               
  081c  6626ffb70401     push dword ptr es:[bx + 0x104]           
  0822  90               nop                                      
  0823  0e               push cs                                  
  0824  e8e702           call 0xb0e                               
  0827  eb2e             jmp 0x857                                
  0829  8bc1             mov ax, cx                               
  082b  6bc050           imul ax, ax, 0x50                        
  082e  c41e8a3f         les bx, ptr [0x3f8a]                     
  0832  03d8             add bx, ax                               
  0834  6626ffb70401     push dword ptr es:[bx + 0x104]           
  083a  8bc6             mov ax, si                               
  083c  6bc050           imul ax, ax, 0x50                        
  083f  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0843  03d8             add bx, ax                               
  0845  8bc7             mov ax, di                               
  0847  c1e002           shl ax, 2                                
  084a  03d8             add bx, ax                               
  084c  6626ffb70401     push dword ptr es:[bx + 0x104]           
  0852  90               nop                                      
  0853  0e               push cs                                  
  0854  e8b701           call 0xa0e                               
  0857  83c408           add sp, 8                                
  085a  46               inc si                                   
  085b  83fe04           cmp si, 4                                
  085e  7d03             jge 0x863                                
  0860  e96efd           jmp 0x5d1                                
  0863  5f               pop di                                   
  0864  5e               pop si                                   
  0865  5d               pop bp                                   
  0866  cb               retf                                     

ovl03_0867:  ; ENTRY
  0867  55               push bp                                  
  0868  8bec             mov bp, sp                               
  086a  83ec02           sub sp, 2                                
  086d  56               push si                                  
  086e  57               push di                                  
  086f  33f6             xor si, si                               
  0871  eb49             jmp 0x8bc                                
  0873  33ff             xor di, di                               
  0875  eb3e             jmp 0x8b5                                
  0877  8bc7             mov ax, di                               
  0879  6bc070           imul ax, ax, 0x70                        
  087c  c41e8a3f         les bx, ptr [0x3f8a]                     
  0880  03d8             add bx, ax                               
  0882  03de             add bx, si                               
  0884  2680bf206107     cmp byte ptr es:[bx + 0x6120], 7         
  088a  7515             jne 0x8a1                                
  088c  8bc7             mov ax, di                               
  088e  6bc070           imul ax, ax, 0x70                        
  0891  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0895  03d8             add bx, ax                               
  0897  03de             add bx, si                               
  0899  26c687206103     mov byte ptr es:[bx + 0x6120], 3         
  089f  eb13             jmp 0x8b4                                
  08a1  8bc7             mov ax, di                               
  08a3  6bc070           imul ax, ax, 0x70                        
  08a6  c41e8a3f         les bx, ptr [0x3f8a]                     
  08aa  03d8             add bx, ax                               
  08ac  03de             add bx, si                               
  08ae  26c687206100     mov byte ptr es:[bx + 0x6120], 0         
  08b4  47               inc di                                   
  08b5  81ff9c00         cmp di, 0x9c                             
  08b9  7cbc             jl 0x877                                 
  08bb  46               inc si                                   
  08bc  83fe70           cmp si, 0x70                             
  08bf  7cb2             jl 0x873                                 
  08c1  c746fe0000       mov word ptr [bp - 2], 0                 
  08c6  e9e100           jmp 0x9aa                                
  08c9  33f6             xor si, si                               
  08cb  eb2d             jmp 0x8fa                                
  08cd  33ff             xor di, di                               
  08cf  eb22             jmp 0x8f3                                
  08d1  57               push di                                  
  08d2  56               push si                                  
  08d3  90               nop                                      
  08d4  0e               push cs                                  
  08d5  e8e507           call 0x10bd                              
  08d8  83c404           add sp, 4                                
  08db  0bc0             or ax, ax                                
  08dd  7413             je 0x8f2                                 
  08df  8bc7             mov ax, di                               
  08e1  6bc070           imul ax, ax, 0x70                        
  08e4  c41e8a3f         les bx, ptr [0x3f8a]                     
  08e8  03d8             add bx, ax                               
  08ea  03de             add bx, si                               
  08ec  26c687206102     mov byte ptr es:[bx + 0x6120], 2         
  08f2  47               inc di                                   
  08f3  81ff9c00         cmp di, 0x9c                             
  08f7  7cd8             jl 0x8d1                                 
  08f9  46               inc si                                   
  08fa  83fe70           cmp si, 0x70                             
  08fd  7cce             jl 0x8cd                                 
  08ff  33ff             xor di, di                               
  0901  eb2c             jmp 0x92f                                
  0903  33f6             xor si, si                               
  0905  eb22             jmp 0x929                                
  0907  57               push di                                  
  0908  56               push si                                  
  0909  90               nop                                      
  090a  0e               push cs                                  
  090b  e8af07           call 0x10bd                              
  090e  83c404           add sp, 4                                
  0911  0bc0             or ax, ax                                
  0913  7413             je 0x928                                 
  0915  8bc7             mov ax, di                               
  0917  6bc070           imul ax, ax, 0x70                        
  091a  c41e8a3f         les bx, ptr [0x3f8a]                     
  091e  03d8             add bx, ax                               
  0920  03de             add bx, si                               
  0922  26c687206102     mov byte ptr es:[bx + 0x6120], 2         
  0928  46               inc si                                   
  0929  83fe70           cmp si, 0x70                             
  092c  7cd9             jl 0x907                                 
  092e  47               inc di                                   
  092f  81ff9c00         cmp di, 0x9c                             
  0933  7cce             jl 0x903                                 
  0935  be7000           mov si, 0x70                             
  0938  eb2d             jmp 0x967                                
  093a  bf9c00           mov di, 0x9c                             
  093d  eb21             jmp 0x960                                
  093f  57               push di                                  
  0940  56               push si                                  
  0941  90               nop                                      
  0942  0e               push cs                                  
  0943  e87707           call 0x10bd                              
  0946  83c404           add sp, 4                                
  0949  0bc0             or ax, ax                                
  094b  7413             je 0x960                                 
  094d  8bc7             mov ax, di                               
  094f  6bc070           imul ax, ax, 0x70                        
  0952  c41e8a3f         les bx, ptr [0x3f8a]                     
  0956  03d8             add bx, ax                               
  0958  03de             add bx, si                               
  095a  26c687206102     mov byte ptr es:[bx + 0x6120], 2         
  0960  8bc7             mov ax, di                               
  0962  4f               dec di                                   
  0963  0bc0             or ax, ax                                
  0965  75d8             jne 0x93f                                
  0967  8bc6             mov ax, si                               
  0969  4e               dec si                                   
  096a  0bc0             or ax, ax                                
  096c  75cc             jne 0x93a                                
  096e  bf9c00           mov di, 0x9c                             
  0971  eb2d             jmp 0x9a0                                
  0973  be7000           mov si, 0x70                             
  0976  eb21             jmp 0x999                                
  0978  57               push di                                  
  0979  56               push si                                  
  097a  90               nop                                      
  097b  0e               push cs                                  
  097c  e83e07           call 0x10bd                              
  097f  83c404           add sp, 4                                
  0982  0bc0             or ax, ax                                
  0984  7413             je 0x999                                 
  0986  8bc7             mov ax, di                               
  0988  6bc070           imul ax, ax, 0x70                        
  098b  c41e8a3f         les bx, ptr [0x3f8a]                     
  098f  03d8             add bx, ax                               
  0991  03de             add bx, si                               
  0993  26c687206102     mov byte ptr es:[bx + 0x6120], 2         
  0999  8bc6             mov ax, si                               
  099b  4e               dec si                                   
  099c  0bc0             or ax, ax                                
  099e  75d8             jne 0x978                                
  09a0  8bc7             mov ax, di                               
  09a2  4f               dec di                                   
  09a3  0bc0             or ax, ax                                
  09a5  75cc             jne 0x973                                
  09a7  ff46fe           inc word ptr [bp - 2]                    
  09aa  837efe02         cmp word ptr [bp - 2], 2                 
  09ae  7d03             jge 0x9b3                                
  09b0  e916ff           jmp 0x8c9                                
  09b3  33f6             xor si, si                               
  09b5  eb49             jmp 0xa00                                
  09b7  33ff             xor di, di                               
  09b9  eb3e             jmp 0x9f9                                
  09bb  8bc7             mov ax, di                               
  09bd  6bc070           imul ax, ax, 0x70                        
  09c0  c41e8a3f         les bx, ptr [0x3f8a]                     
  09c4  03d8             add bx, ax                               
  09c6  03de             add bx, si                               
  09c8  2680bf206102     cmp byte ptr es:[bx + 0x6120], 2         
  09ce  7515             jne 0x9e5                                
  09d0  8bc7             mov ax, di                               
  09d2  6bc070           imul ax, ax, 0x70                        
  09d5  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  09d9  03d8             add bx, ax                               
  09db  03de             add bx, si                               
  09dd  26c687206102     mov byte ptr es:[bx + 0x6120], 2         
  09e3  eb13             jmp 0x9f8                                
  09e5  8bc7             mov ax, di                               
  09e7  6bc070           imul ax, ax, 0x70                        
  09ea  c41e8a3f         les bx, ptr [0x3f8a]                     
  09ee  03d8             add bx, ax                               
  09f0  03de             add bx, si                               
  09f2  26c687206107     mov byte ptr es:[bx + 0x6120], 7         
  09f8  47               inc di                                   
  09f9  81ff9c00         cmp di, 0x9c                             
  09fd  7cbc             jl 0x9bb                                 
  09ff  46               inc si                                   
  0a00  83fe70           cmp si, 0x70                             
  0a03  7cb2             jl 0x9b7                                 
  0a05  9a2f00622f       lcall 0x2f62, 0x2f                       -> ovl02:0449
  0a0a  5f               pop di                                   
  0a0b  5e               pop si                                   
  0a0c  c9               leave                                    
  0a0d  cb               retf                                     

ovl03_0a0e:  ; ENTRY
  0a0e  55               push bp                                  
  0a0f  8bec             mov bp, sp                               
  0a11  83ec0e           sub sp, 0xe                              
  0a14  56               push si                                  
  0a15  33f6             xor si, si                               
  0a17  668b4606         mov eax, dword ptr [bp + 6]              
  0a1b  668946fc         mov dword ptr [bp - 4], eax              
  0a1f  16               push ss                                  
  0a20  8d46f8           lea ax, [bp - 8]                         
  0a23  50               push ax                                  
  0a24  66ff760a         push dword ptr [bp + 0xa]                
  0a28  66ff7606         push dword ptr [bp + 6]                  
  0a2c  90               nop                                      
  0a2d  0e               push cs                                  
  0a2e  e89f03           call 0xdd0                               
  0a31  83c40c           add sp, 0xc                              
  0a34  e9cd00           jmp 0xb04                                
  0a37  16               push ss                                  
  0a38  8d46f4           lea ax, [bp - 0xc]                       
  0a3b  50               push ax                                  
  0a3c  66ff760a         push dword ptr [bp + 0xa]                
  0a40  66ff76fc         push dword ptr [bp - 4]                  
  0a44  90               nop                                      
  0a45  0e               push cs                                  
  0a46  e88703           call 0xdd0                               
  0a49  83c40c           add sp, 0xc                              
  0a4c  66ff760a         push dword ptr [bp + 0xa]                
  0a50  66ff76fc         push dword ptr [bp - 4]                  
  0a54  90               nop                                      
  0a55  0e               push cs                                  
  0a56  e89405           call 0xfed                               
  0a59  83c408           add sp, 8                                
  0a5c  3d0300           cmp ax, 3                                
  0a5f  7d0e             jge 0xa6f                                
  0a61  8b46f4           mov ax, word ptr [bp - 0xc]              
  0a64  0146fc           add word ptr [bp - 4], ax                
  0a67  8b46f6           mov ax, word ptr [bp - 0xa]              
  0a6a  0146fe           add word ptr [bp - 2], ax                
  0a6d  eb4f             jmp 0xabe                                
  0a6f  666a03           push 3                                   
  0a72  6a01             push 1                                   
  0a74  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0a79  83c406           add sp, 6                                
  0a7c  8946f2           mov word ptr [bp - 0xe], ax              
  0a7f  3d0100           cmp ax, 1                                
  0a82  74dd             je 0xa61                                 
  0a84  3d0200           cmp ax, 2                                
  0a87  7409             je 0xa92                                 
  0a89  3d0300           cmp ax, 3                                
  0a8c  740f             je 0xa9d                                 
  0a8e  eb2e             jmp 0xabe                                
  0a90  ebcf             jmp 0xa61                                
  0a92  8b46f8           mov ax, word ptr [bp - 8]                
  0a95  0146fc           add word ptr [bp - 4], ax                
  0a98  8b46fa           mov ax, word ptr [bp - 6]                
  0a9b  ebcd             jmp 0xa6a                                
  0a9d  16               push ss                                  
  0a9e  8d46f4           lea ax, [bp - 0xc]                       
  0aa1  50               push ax                                  
  0aa2  90               nop                                      
  0aa3  0e               push cs                                  
  0aa4  e8a305           call 0x104a                              
  0aa7  83c404           add sp, 4                                
  0aaa  8b46f4           mov ax, word ptr [bp - 0xc]              
  0aad  0146fc           add word ptr [bp - 4], ax                
  0ab0  8b46f6           mov ax, word ptr [bp - 0xa]              
  0ab3  0146fe           add word ptr [bp - 2], ax                
  0ab6  668b46f4         mov eax, dword ptr [bp - 0xc]            
  0aba  668946f8         mov dword ptr [bp - 8], eax              
  0abe  16               push ss                                  
  0abf  8d46fe           lea ax, [bp - 2]                         
  0ac2  50               push ax                                  
  0ac3  16               push ss                                  
  0ac4  8d46fc           lea ax, [bp - 4]                         
  0ac7  50               push ax                                  
  0ac8  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  0acd  83c408           add sp, 8                                
  0ad0  8b46fe           mov ax, word ptr [bp - 2]                
  0ad3  6bc070           imul ax, ax, 0x70                        
  0ad6  c41e8a3f         les bx, ptr [0x3f8a]                     
  0ada  03d8             add bx, ax                               
  0adc  035efc           add bx, word ptr [bp - 4]                
  0adf  26c687206107     mov byte ptr es:[bx + 0x6120], 7         
  0ae5  66ff76fc         push dword ptr [bp - 4]                  
  0ae9  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0aee  83c404           add sp, 4                                
  0af1  8b46fc           mov ax, word ptr [bp - 4]                
  0af4  3b460a           cmp ax, word ptr [bp + 0xa]              
  0af7  750b             jne 0xb04                                
  0af9  8b46fe           mov ax, word ptr [bp - 2]                
  0afc  3b460c           cmp ax, word ptr [bp + 0xc]              
  0aff  7503             jne 0xb04                                
  0b01  be0100           mov si, 1                                
  0b04  0bf6             or si, si                                
  0b06  7503             jne 0xb0b                                
  0b08  e92cff           jmp 0xa37                                
  0b0b  5e               pop si                                   
  0b0c  c9               leave                                    
  0b0d  cb               retf                                     

ovl03_0b0e:  ; ENTRY
  0b0e  55               push bp                                  
  0b0f  8bec             mov bp, sp                               
  0b11  83ec0c           sub sp, 0xc                              
  0b14  56               push si                                  
  0b15  57               push di                                  
  0b16  66ff7606         push dword ptr [bp + 6]                  
  0b1a  90               nop                                      
  0b1b  0e               push cs                                  
  0b1c  e8f704           call 0x1016                              
  0b1f  83c404           add sp, 4                                
  0b22  8bf0             mov si, ax                               
  0b24  66ff760a         push dword ptr [bp + 0xa]                
  0b28  90               nop                                      
  0b29  0e               push cs                                  
  0b2a  e8e904           call 0x1016                              
  0b2d  83c404           add sp, 4                                
  0b30  8bd8             mov bx, ax                               
  0b32  3bf3             cmp si, bx                               
  0b34  7571             jne 0xba7                                
  0b36  16               push ss                                  
  0b37  8d46fc           lea ax, [bp - 4]                         
  0b3a  50               push ax                                  
  0b3b  66ff760a         push dword ptr [bp + 0xa]                
  0b3f  66ff7606         push dword ptr [bp + 6]                  
  0b43  90               nop                                      
  0b44  0e               push cs                                  
  0b45  e88802           call 0xdd0                               
  0b48  83c40c           add sp, 0xc                              
  0b4b  668b4606         mov eax, dword ptr [bp + 6]              
  0b4f  668946f8         mov dword ptr [bp - 8], eax              
  0b53  eb3f             jmp 0xb94                                
  0b55  8b46fc           mov ax, word ptr [bp - 4]                
  0b58  0146f8           add word ptr [bp - 8], ax                
  0b5b  8b46fe           mov ax, word ptr [bp - 2]                
  0b5e  0146fa           add word ptr [bp - 6], ax                
  0b61  16               push ss                                  
  0b62  8d46fa           lea ax, [bp - 6]                         
  0b65  50               push ax                                  
  0b66  16               push ss                                  
  0b67  8d46f8           lea ax, [bp - 8]                         
  0b6a  50               push ax                                  
  0b6b  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  0b70  83c408           add sp, 8                                
  0b73  8b46fa           mov ax, word ptr [bp - 6]                
  0b76  6bc070           imul ax, ax, 0x70                        
  0b79  c41e8a3f         les bx, ptr [0x3f8a]                     
  0b7d  03d8             add bx, ax                               
  0b7f  035ef8           add bx, word ptr [bp - 8]                
  0b82  26c687206107     mov byte ptr es:[bx + 0x6120], 7         
  0b88  66ff76f8         push dword ptr [bp - 8]                  
  0b8c  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0b91  83c404           add sp, 4                                
  0b94  8b46f8           mov ax, word ptr [bp - 8]                
  0b97  3b460a           cmp ax, word ptr [bp + 0xa]              
  0b9a  75b9             jne 0xb55                                
  0b9c  8b46fa           mov ax, word ptr [bp - 6]                
  0b9f  3b460c           cmp ax, word ptr [bp + 0xc]              
  0ba2  75b1             jne 0xb55                                
  0ba4  e93c01           jmp 0xce3                                
  0ba7  8bc6             mov ax, si                               
  0ba9  2bc3             sub ax, bx                               
  0bab  99               cdq                                      
  0bac  33c2             xor ax, dx                               
  0bae  2bc2             sub ax, dx                               
  0bb0  3d0200           cmp ax, 2                                
  0bb3  7512             jne 0xbc7                                
  0bb5  66ff760a         push dword ptr [bp + 0xa]                
  0bb9  66ff7606         push dword ptr [bp + 6]                  
  0bbd  0e               push cs                                  
  0bbe  e84dfe           call 0xa0e                               
  0bc1  83c408           add sp, 8                                
  0bc4  e91c01           jmp 0xce3                                
  0bc7  8bc6             mov ax, si                               
  0bc9  2bc3             sub ax, bx                               
  0bcb  99               cdq                                      
  0bcc  33c2             xor ax, dx                               
  0bce  2bc2             sub ax, dx                               
  0bd0  3d0300           cmp ax, 3                                
  0bd3  7504             jne 0xbd9                                
  0bd5  33ff             xor di, di                               
  0bd7  eb1a             jmp 0xbf3                                
  0bd9  8bc6             mov ax, si                               
  0bdb  2bc3             sub ax, bx                               
  0bdd  99               cdq                                      
  0bde  33c2             xor ax, dx                               
  0be0  2bc2             sub ax, dx                               
  0be2  3d0100           cmp ax, 1                                
  0be5  750c             jne 0xbf3                                
  0be7  3bf3             cmp si, bx                               
  0be9  7e04             jle 0xbef                                
  0beb  8bc6             mov ax, si                               
  0bed  eb02             jmp 0xbf1                                
  0bef  8bc3             mov ax, bx                               
  0bf1  8bf8             mov di, ax                               
  0bf3  8bc7             mov ax, di                               
  0bf5  c1e002           shl ax, 2                                
  0bf8  c41e8a3f         les bx, ptr [0x3f8a]                     
  0bfc  03d8             add bx, ax                               
  0bfe  66268b477c       mov eax, dword ptr es:[bx + 0x7c]        
  0c03  668946f4         mov dword ptr [bp - 0xc], eax            
  0c07  16               push ss                                  
  0c08  8d46fc           lea ax, [bp - 4]                         
  0c0b  50               push ax                                  
  0c0c  66ff76f4         push dword ptr [bp - 0xc]                
  0c10  66ff7606         push dword ptr [bp + 6]                  
  0c14  90               nop                                      
  0c15  0e               push cs                                  
  0c16  e8b701           call 0xdd0                               
  0c19  83c40c           add sp, 0xc                              
  0c1c  668b4606         mov eax, dword ptr [bp + 6]              
  0c20  668946f8         mov dword ptr [bp - 8], eax              
  0c24  eb3f             jmp 0xc65                                
  0c26  8b46fc           mov ax, word ptr [bp - 4]                
  0c29  0146f8           add word ptr [bp - 8], ax                
  0c2c  8b46fe           mov ax, word ptr [bp - 2]                
  0c2f  0146fa           add word ptr [bp - 6], ax                
  0c32  16               push ss                                  
  0c33  8d46fa           lea ax, [bp - 6]                         
  0c36  50               push ax                                  
  0c37  16               push ss                                  
  0c38  8d46f8           lea ax, [bp - 8]                         
  0c3b  50               push ax                                  
  0c3c  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  0c41  83c408           add sp, 8                                
  0c44  8b46fa           mov ax, word ptr [bp - 6]                
  0c47  6bc070           imul ax, ax, 0x70                        
  0c4a  c41e8a3f         les bx, ptr [0x3f8a]                     
  0c4e  03d8             add bx, ax                               
  0c50  035ef8           add bx, word ptr [bp - 8]                
  0c53  26c687206107     mov byte ptr es:[bx + 0x6120], 7         
  0c59  66ff76f8         push dword ptr [bp - 8]                  
  0c5d  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0c62  83c404           add sp, 4                                
  0c65  8b46f8           mov ax, word ptr [bp - 8]                
  0c68  3b46f4           cmp ax, word ptr [bp - 0xc]              
  0c6b  75b9             jne 0xc26                                
  0c6d  8b46fa           mov ax, word ptr [bp - 6]                
  0c70  3b46f6           cmp ax, word ptr [bp - 0xa]              
  0c73  75b1             jne 0xc26                                
  0c75  16               push ss                                  
  0c76  8d46fc           lea ax, [bp - 4]                         
  0c79  50               push ax                                  
  0c7a  66ff76f4         push dword ptr [bp - 0xc]                
  0c7e  66ff760a         push dword ptr [bp + 0xa]                
  0c82  90               nop                                      
  0c83  0e               push cs                                  
  0c84  e84901           call 0xdd0                               
  0c87  83c40c           add sp, 0xc                              
  0c8a  668b460a         mov eax, dword ptr [bp + 0xa]            
  0c8e  668946f8         mov dword ptr [bp - 8], eax              
  0c92  eb3f             jmp 0xcd3                                
  0c94  8b46fc           mov ax, word ptr [bp - 4]                
  0c97  0146f8           add word ptr [bp - 8], ax                
  0c9a  8b46fe           mov ax, word ptr [bp - 2]                
  0c9d  0146fa           add word ptr [bp - 6], ax                
  0ca0  16               push ss                                  
  0ca1  8d46fa           lea ax, [bp - 6]                         
  0ca4  50               push ax                                  
  0ca5  16               push ss                                  
  0ca6  8d46f8           lea ax, [bp - 8]                         
  0ca9  50               push ax                                  
  0caa  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  0caf  83c408           add sp, 8                                
  0cb2  8b46fa           mov ax, word ptr [bp - 6]                
  0cb5  6bc070           imul ax, ax, 0x70                        
  0cb8  c41e8a3f         les bx, ptr [0x3f8a]                     
  0cbc  03d8             add bx, ax                               
  0cbe  035ef8           add bx, word ptr [bp - 8]                
  0cc1  26c687206107     mov byte ptr es:[bx + 0x6120], 7         
  0cc7  66ff76f8         push dword ptr [bp - 8]                  
  0ccb  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0cd0  83c404           add sp, 4                                
  0cd3  8b46f8           mov ax, word ptr [bp - 8]                
  0cd6  3b46f4           cmp ax, word ptr [bp - 0xc]              
  0cd9  75b9             jne 0xc94                                
  0cdb  8b46fa           mov ax, word ptr [bp - 6]                
  0cde  3b46f6           cmp ax, word ptr [bp - 0xa]              
  0ce1  75b1             jne 0xc94                                
  0ce3  5f               pop di                                   
  0ce4  5e               pop si                                   
  0ce5  c9               leave                                    
  0ce6  cb               retf                                     

ovl03_0ce7:  ; ENTRY
  0ce7  55               push bp                                  
  0ce8  8bec             mov bp, sp                               
  0cea  56               push si                                  
  0ceb  57               push di                                  
  0cec  33f6             xor si, si                               
  0cee  e9ad00           jmp 0xd9e                                
  0cf1  33ff             xor di, di                               
  0cf3  e99e00           jmp 0xd94                                
  0cf6  8bc7             mov ax, di                               
  0cf8  6bc070           imul ax, ax, 0x70                        
  0cfb  c41e8a3f         les bx, ptr [0x3f8a]                     
  0cff  03d8             add bx, ax                               
  0d01  03de             add bx, si                               
  0d03  2680bf206102     cmp byte ptr es:[bx + 0x6120], 2         
  0d09  7403             je 0xd0e                                 
  0d0b  e98500           jmp 0xd93                                
  0d0e  57               push di                                  
  0d0f  56               push si                                  
  0d10  90               nop                                      
  0d11  0e               push cs                                  
  0d12  e86804           call 0x117d                              
  0d15  83c404           add sp, 4                                
  0d18  0bc0             or ax, ax                                
  0d1a  741d             je 0xd39                                 
  0d1c  8bc7             mov ax, di                               
  0d1e  6bc070           imul ax, ax, 0x70                        
  0d21  c41e8a3f         les bx, ptr [0x3f8a]                     
  0d25  03d8             add bx, ax                               
  0d27  03de             add bx, si                               
  0d29  26c687206103     mov byte ptr es:[bx + 0x6120], 3         
  0d2f  57               push di                                  
  0d30  56               push si                                  
  0d31  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0d36  83c404           add sp, 4                                
  0d39  6a05             push 5                                   
  0d3b  57               push di                                  
  0d3c  56               push si                                  
  0d3d  90               nop                                      
  0d3e  0e               push cs                                  
  0d3f  e8b304           call 0x11f5                              
  0d42  83c406           add sp, 6                                
  0d45  0bc0             or ax, ax                                
  0d47  741d             je 0xd66                                 
  0d49  8bc7             mov ax, di                               
  0d4b  6bc070           imul ax, ax, 0x70                        
  0d4e  c41e8a3f         les bx, ptr [0x3f8a]                     
  0d52  03d8             add bx, ax                               
  0d54  03de             add bx, si                               
  0d56  26c687206103     mov byte ptr es:[bx + 0x6120], 3         
  0d5c  57               push di                                  
  0d5d  56               push si                                  
  0d5e  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0d63  83c404           add sp, 4                                
  0d66  6a06             push 6                                   
  0d68  57               push di                                  
  0d69  56               push si                                  
  0d6a  90               nop                                      
  0d6b  0e               push cs                                  
  0d6c  e88604           call 0x11f5                              
  0d6f  83c406           add sp, 6                                
  0d72  0bc0             or ax, ax                                
  0d74  741d             je 0xd93                                 
  0d76  8bc7             mov ax, di                               
  0d78  6bc070           imul ax, ax, 0x70                        
  0d7b  c41e8a3f         les bx, ptr [0x3f8a]                     
  0d7f  03d8             add bx, ax                               
  0d81  03de             add bx, si                               
  0d83  26c687206103     mov byte ptr es:[bx + 0x6120], 3         
  0d89  57               push di                                  
  0d8a  56               push si                                  
  0d8b  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0d90  83c404           add sp, 4                                
  0d93  47               inc di                                   
  0d94  81ff9c00         cmp di, 0x9c                             
  0d98  7d03             jge 0xd9d                                
  0d9a  e959ff           jmp 0xcf6                                
  0d9d  46               inc si                                   
  0d9e  83fe70           cmp si, 0x70                             
  0da1  7d03             jge 0xda6                                
  0da3  e94bff           jmp 0xcf1                                
  0da6  5f               pop di                                   
  0da7  5e               pop si                                   
  0da8  5d               pop bp                                   
  0da9  cb               retf                                     

ovl03_0daa:  ; ENTRY
  0daa  55               push bp                                  
  0dab  8bec             mov bp, sp                               
  0dad  56               push si                                  
  0dae  33f6             xor si, si                               
  0db0  eb11             jmp 0xdc3                                
  0db2  666800000100     push 0x10000                             
  0db8  6a01             push 1                                   
  0dba  9a2500792f       lcall 0x2f79, 0x25                       -> ovl06:005d
  0dbf  83c406           add sp, 6                                
  0dc2  46               inc si                                   
  0dc3  3b7606           cmp si, word ptr [bp + 6]                
  0dc6  7cea             jl 0xdb2                                 
  0dc8  9a2a00792f       lcall 0x2f79, 0x2a                       -> ovl06:060c
  0dcd  5e               pop si                                   
  0dce  5d               pop bp                                   
  0dcf  cb               retf                                     

ovl03_0dd0:  ; ENTRY
  0dd0  55               push bp                                  
  0dd1  8bec             mov bp, sp                               
  0dd3  83ec0a           sub sp, 0xa                              
  0dd6  8b460a           mov ax, word ptr [bp + 0xa]              
  0dd9  3b4606           cmp ax, word ptr [bp + 6]                
  0ddc  7534             jne 0xe12                                
  0dde  8b4608           mov ax, word ptr [bp + 8]                
  0de1  3b460c           cmp ax, word ptr [bp + 0xc]              
  0de4  7513             jne 0xdf9                                
  0de6  6a00             push 0                                   
  0de8  6a00             push 0                                   
  0dea  66ff760e         push dword ptr [bp + 0xe]                
  0dee  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  0df3  83c408           add sp, 8                                
  0df6  e9f201           jmp 0xfeb                                
  0df9  8b4608           mov ax, word ptr [bp + 8]                
  0dfc  3b460c           cmp ax, word ptr [bp + 0xc]              
  0dff  7e03             jle 0xe04                                
  0e01  e9e201           jmp 0xfe6                                
  0e04  8b4608           mov ax, word ptr [bp + 8]                
  0e07  3b460c           cmp ax, word ptr [bp + 0xc]              
  0e0a  7c03             jl 0xe0f                                 
  0e0c  e9dc01           jmp 0xfeb                                
  0e0f  e92e01           jmp 0xf40                                
  0e12  8b460c           mov ax, word ptr [bp + 0xc]              
  0e15  3b4608           cmp ax, word ptr [bp + 8]                
  0e18  7525             jne 0xe3f                                
  0e1a  8b4606           mov ax, word ptr [bp + 6]                
  0e1d  3b460a           cmp ax, word ptr [bp + 0xa]              
  0e20  74c4             je 0xde6                                 
  0e22  8b4606           mov ax, word ptr [bp + 6]                
  0e25  3b460a           cmp ax, word ptr [bp + 0xa]              
  0e28  7e05             jle 0xe2f                                
  0e2a  6a00             push 0                                   
  0e2c  e9dd00           jmp 0xf0c                                
  0e2f  8b4606           mov ax, word ptr [bp + 6]                
  0e32  3b460a           cmp ax, word ptr [bp + 0xa]              
  0e35  7c03             jl 0xe3a                                 
  0e37  e9b101           jmp 0xfeb                                
  0e3a  6a00             push 0                                   
  0e3c  e98d01           jmp 0xfcc                                
  0e3f  8b460c           mov ax, word ptr [bp + 0xc]              
  0e42  2b4608           sub ax, word ptr [bp + 8]                
  0e45  8946f6           mov word ptr [bp - 0xa], ax              
  0e48  cd3b             int 0x3b                                 
  0e4a  46               inc si                                   
  0e4b  f68b460a2b       test byte ptr [bp + di + 0xa46], 0x2b    
  0e50  46               inc si                                   
  0e51  06               push es                                  
  0e52  8946f6           mov word ptr [bp - 0xa], ax              
  0e55  cd3b             int 0x3b                                 
  0e57  46               inc si                                   
  0e58  f6cd3a           test ch, 0x3a                            
  0e5b  f9               stc                                      
  0e5c  cd39             int 0x39                                 
  0e5e  5e               pop si                                   
  0e5f  f8               clc                                      
  0e60  cd3d             int 0x3d                                 
  0e62  8b4606           mov ax, word ptr [bp + 6]                
  0e65  3b460a           cmp ax, word ptr [bp + 0xa]              
  0e68  7f03             jg 0xe6d                                 
  0e6a  e9be00           jmp 0xf2b                                
  0e6d  cd39             int 0x39                                 
  0e6f  46               inc si                                   
  0e70  f8               clc                                      
  0e71  cd38             int 0x38                                 
  0e73  1e               push ds                                  
  0e74  92               xchg dx, ax                              
  0e75  02cd             add cl, ch                               
  0e77  397ef6           cmp word ptr [bp - 0xa], di              
  0e7a  cd3d             int 0x3d                                 
  0e7c  8b46f6           mov ax, word ptr [bp - 0xa]              
  0e7f  9e               sahf                                     
  0e80  7203             jb 0xe85                                 
  0e82  e96101           jmp 0xfe6                                
  0e85  cd39             int 0x39                                 
  0e87  46               inc si                                   
  0e88  f8               clc                                      
  0e89  cd38             int 0x38                                 
  0e8b  1e               push ds                                  
  0e8c  92               xchg dx, ax                              
  0e8d  02cd             add cl, ch                               
  0e8f  397ef6           cmp word ptr [bp - 0xa], di              
  0e92  cd3d             int 0x3d                                 
  0e94  8b46f6           mov ax, word ptr [bp - 0xa]              
  0e97  9e               sahf                                     
  0e98  7319             jae 0xeb3                                
  0e9a  cd39             int 0x39                                 
  0e9c  46               inc si                                   
  0e9d  f8               clc                                      
  0e9e  cd38             int 0x38                                 
  0ea0  1e               push ds                                  
  0ea1  9a02cd397e       lcall 0x7e39, 0xcd02                     -> 7e39:cd02
  0ea6  f6cd3d           test ch, 0x3d                            
  0ea9  8b46f6           mov ax, word ptr [bp - 0xa]              
  0eac  9e               sahf                                     
  0ead  7204             jb 0xeb3                                 
  0eaf  6aff             push -1                                  
  0eb1  eb59             jmp 0xf0c                                
  0eb3  cd39             int 0x39                                 
  0eb5  46               inc si                                   
  0eb6  f8               clc                                      
  0eb7  cd38             int 0x38                                 
  0eb9  1e               push ds                                  
  0eba  9a02cd397e       lcall 0x7e39, 0xcd02                     -> 7e39:cd02
  0ebf  f6cd3d           test ch, 0x3d                            
  0ec2  8b46f6           mov ax, word ptr [bp - 0xa]              
  0ec5  9e               sahf                                     
  0ec6  7318             jae 0xee0                                
  0ec8  cd39             int 0x39                                 
  0eca  46               inc si                                   
  0ecb  f8               clc                                      
  0ecc  cd38             int 0x38                                 
  0ece  1e               push ds                                  
  0ecf  a202cd           mov byte ptr [0xcd02], al                
  0ed2  397ef6           cmp word ptr [bp - 0xa], di              
  0ed5  cd3d             int 0x3d                                 
  0ed7  8b46f6           mov ax, word ptr [bp - 0xa]              
  0eda  9e               sahf                                     
  0edb  7203             jb 0xee0                                 
  0edd  e94aff           jmp 0xe2a                                
  0ee0  cd39             int 0x39                                 
  0ee2  46               inc si                                   
  0ee3  f8               clc                                      
  0ee4  cd38             int 0x38                                 
  0ee6  1e               push ds                                  
  0ee7  a202cd           mov byte ptr [0xcd02], al                
  0eea  397ef6           cmp word ptr [bp - 0xa], di              
  0eed  cd3d             int 0x3d                                 
  0eef  8b46f6           mov ax, word ptr [bp - 0xa]              
  0ef2  9e               sahf                                     
  0ef3  731c             jae 0xf11                                
  0ef5  cd39             int 0x39                                 
  0ef7  46               inc si                                   
  0ef8  f8               clc                                      
  0ef9  cd38             int 0x38                                 
  0efb  1e               push ds                                  
  0efc  aa               stosb byte ptr es:[di], al               
  0efd  02cd             add cl, ch                               
  0eff  397ef6           cmp word ptr [bp - 0xa], di              
  0f02  cd3d             int 0x3d                                 
  0f04  8b46f6           mov ax, word ptr [bp - 0xa]              
  0f07  9e               sahf                                     
  0f08  7207             jb 0xf11                                 
  0f0a  6a01             push 1                                   
  0f0c  6aff             push -1                                  
  0f0e  e9d9fe           jmp 0xdea                                
  0f11  cd39             int 0x39                                 
  0f13  46               inc si                                   
  0f14  f8               clc                                      
  0f15  cd38             int 0x38                                 
  0f17  1e               push ds                                  
  0f18  aa               stosb byte ptr es:[di], al               
  0f19  02cd             add cl, ch                               
  0f1b  397ef6           cmp word ptr [bp - 0xa], di              
  0f1e  cd3d             int 0x3d                                 
  0f20  8b46f6           mov ax, word ptr [bp - 0xa]              
  0f23  9e               sahf                                     
  0f24  7203             jb 0xf29                                 
  0f26  e9c200           jmp 0xfeb                                
  0f29  eb15             jmp 0xf40                                
  0f2b  cd39             int 0x39                                 
  0f2d  46               inc si                                   
  0f2e  f8               clc                                      
  0f2f  cd38             int 0x38                                 
  0f31  1e               push ds                                  
  0f32  92               xchg dx, ax                              
  0f33  02cd             add cl, ch                               
  0f35  397ef6           cmp word ptr [bp - 0xa], di              
  0f38  cd3d             int 0x3d                                 
  0f3a  8b46f6           mov ax, word ptr [bp - 0xa]              
  0f3d  9e               sahf                                     
  0f3e  7205             jb 0xf45                                 
  0f40  6a01             push 1                                   
  0f42  e9a3fe           jmp 0xde8                                
  0f45  cd39             int 0x39                                 
  0f47  46               inc si                                   
  0f48  f8               clc                                      
  0f49  cd38             int 0x38                                 
  0f4b  1e               push ds                                  
  0f4c  92               xchg dx, ax                              
  0f4d  02cd             add cl, ch                               
  0f4f  397ef6           cmp word ptr [bp - 0xa], di              
  0f52  cd3d             int 0x3d                                 
  0f54  8b46f6           mov ax, word ptr [bp - 0xa]              
  0f57  9e               sahf                                     
  0f58  7319             jae 0xf73                                
  0f5a  cd39             int 0x39                                 
  0f5c  46               inc si                                   
  0f5d  f8               clc                                      
  0f5e  cd38             int 0x38                                 
  0f60  1e               push ds                                  
  0f61  9a02cd397e       lcall 0x7e39, 0xcd02                     -> 7e39:cd02
  0f66  f6cd3d           test ch, 0x3d                            
  0f69  8b46f6           mov ax, word ptr [bp - 0xa]              
  0f6c  9e               sahf                                     
  0f6d  7204             jb 0xf73                                 
  0f6f  6a01             push 1                                   
  0f71  eb59             jmp 0xfcc                                
  0f73  cd39             int 0x39                                 
  0f75  46               inc si                                   
  0f76  f8               clc                                      
  0f77  cd38             int 0x38                                 
  0f79  1e               push ds                                  
  0f7a  9a02cd397e       lcall 0x7e39, 0xcd02                     -> 7e39:cd02
  0f7f  f6cd3d           test ch, 0x3d                            
  0f82  8b46f6           mov ax, word ptr [bp - 0xa]              
  0f85  9e               sahf                                     
  0f86  7318             jae 0xfa0                                
  0f88  cd39             int 0x39                                 
  0f8a  46               inc si                                   
  0f8b  f8               clc                                      
  0f8c  cd38             int 0x38                                 
  0f8e  1e               push ds                                  
  0f8f  a202cd           mov byte ptr [0xcd02], al                
  0f92  397ef6           cmp word ptr [bp - 0xa], di              
  0f95  cd3d             int 0x3d                                 
  0f97  8b46f6           mov ax, word ptr [bp - 0xa]              
  0f9a  9e               sahf                                     
  0f9b  7203             jb 0xfa0                                 
  0f9d  e99afe           jmp 0xe3a                                
  0fa0  cd39             int 0x39                                 
  0fa2  46               inc si                                   
  0fa3  f8               clc                                      
  0fa4  cd38             int 0x38                                 
  0fa6  1e               push ds                                  
  0fa7  a202cd           mov byte ptr [0xcd02], al                
  0faa  397ef6           cmp word ptr [bp - 0xa], di              
  0fad  cd3d             int 0x3d                                 
  0faf  8b46f6           mov ax, word ptr [bp - 0xa]              
  0fb2  9e               sahf                                     
  0fb3  731c             jae 0xfd1                                
  0fb5  cd39             int 0x39                                 
  0fb7  46               inc si                                   
  0fb8  f8               clc                                      
  0fb9  cd38             int 0x38                                 
  0fbb  1e               push ds                                  
  0fbc  aa               stosb byte ptr es:[di], al               
  0fbd  02cd             add cl, ch                               
  0fbf  397ef6           cmp word ptr [bp - 0xa], di              
  0fc2  cd3d             int 0x3d                                 
  0fc4  8b46f6           mov ax, word ptr [bp - 0xa]              
  0fc7  9e               sahf                                     
  0fc8  7207             jb 0xfd1                                 
  0fca  6aff             push -1                                  
  0fcc  6a01             push 1                                   
  0fce  e919fe           jmp 0xdea                                
  0fd1  cd39             int 0x39                                 
  0fd3  46               inc si                                   
  0fd4  f8               clc                                      
  0fd5  cd38             int 0x38                                 
  0fd7  1e               push ds                                  
  0fd8  aa               stosb byte ptr es:[di], al               
  0fd9  02cd             add cl, ch                               
  0fdb  397ef6           cmp word ptr [bp - 0xa], di              
  0fde  cd3d             int 0x3d                                 
  0fe0  8b46f6           mov ax, word ptr [bp - 0xa]              
  0fe3  9e               sahf                                     
  0fe4  7305             jae 0xfeb                                
  0fe6  6aff             push -1                                  
  0fe8  e9fdfd           jmp 0xde8                                
  0feb  c9               leave                                    
  0fec  cb               retf                                     

ovl03_0fed:  ; ENTRY
  0fed  55               push bp                                  
  0fee  8bec             mov bp, sp                               
  0ff0  8b4606           mov ax, word ptr [bp + 6]                
  0ff3  2b460a           sub ax, word ptr [bp + 0xa]              
  0ff6  99               cdq                                      
  0ff7  33c2             xor ax, dx                               
  0ff9  2bc2             sub ax, dx                               
  0ffb  8bd8             mov bx, ax                               
  0ffd  8b4608           mov ax, word ptr [bp + 8]                
  1000  2b460c           sub ax, word ptr [bp + 0xc]              
  1003  99               cdq                                      
  1004  33c2             xor ax, dx                               
  1006  2bc2             sub ax, dx                               
  1008  8bd0             mov dx, ax                               
  100a  3bda             cmp bx, dx                               
  100c  7e04             jle 0x1012                               
  100e  8bc3             mov ax, bx                               
  1010  eb02             jmp 0x1014                               
  1012  8bc2             mov ax, dx                               
  1014  5d               pop bp                                   
  1015  cb               retf                                     

ovl03_1016:  ; ENTRY
  1016  55               push bp                                  
  1017  8bec             mov bp, sp                               
  1019  837e0600         cmp word ptr [bp + 6], 0                 
  101d  7505             jne 0x1024                               
  101f  b80300           mov ax, 3                                
  1022  eb24             jmp 0x1048                               
  1024  837e0800         cmp word ptr [bp + 8], 0                 
  1028  7504             jne 0x102e                               
  102a  33c0             xor ax, ax                               
  102c  eb1a             jmp 0x1048                               
  102e  837e066f         cmp word ptr [bp + 6], 0x6f              
  1032  7505             jne 0x1039                               
  1034  b80100           mov ax, 1                                
  1037  eb0f             jmp 0x1048                               
  1039  817e089b00       cmp word ptr [bp + 8], 0x9b              
  103e  7505             jne 0x1045                               
  1040  b80200           mov ax, 2                                
  1043  eb03             jmp 0x1048                               
  1045  b8ffff           mov ax, 0xffff                           
  1048  5d               pop bp                                   
  1049  cb               retf                                     

ovl03_104a:  ; ENTRY
  104a  55               push bp                                  
  104b  8bec             mov bp, sp                               
  104d  33c9             xor cx, cx                               
  104f  eb2f             jmp 0x1080                               
  1051  8bc1             mov ax, cx                               
  1053  c1e002           shl ax, 2                                
  1056  c41e8a3f         les bx, ptr [0x3f8a]                     
  105a  03d8             add bx, ax                               
  105c  268b87bc00       mov ax, word ptr es:[bx + 0xbc]          
  1061  c45e06           les bx, ptr [bp + 6]                     
  1064  263b07           cmp ax, word ptr es:[bx]                 
  1067  7516             jne 0x107f                               
  1069  268b4702         mov ax, word ptr es:[bx + 2]             
  106d  8bd1             mov dx, cx                               
  106f  c1e202           shl dx, 2                                
  1072  c41e8a3f         les bx, ptr [0x3f8a]                     
  1076  03da             add bx, dx                               
  1078  263b87be00       cmp ax, word ptr es:[bx + 0xbe]          
  107d  7406             je 0x1085                                
  107f  41               inc cx                                   
  1080  83f908           cmp cx, 8                                
  1083  7ccc             jl 0x1051                                
  1085  8bc1             mov ax, cx                               
  1087  05feff           add ax, 0xfffe                           
  108a  50               push ax                                  
  108b  666801000500     push 0x50001                             
  1091  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1096  83c406           add sp, 6                                
  1099  8bc8             mov cx, ax                               
  109b  bb0800           mov bx, 8                                
  109e  99               cdq                                      
  109f  f7fb             idiv bx                                  
  10a1  8bca             mov cx, dx                               
  10a3  8bc1             mov ax, cx                               
  10a5  c1e002           shl ax, 2                                
  10a8  c41e8a3f         les bx, ptr [0x3f8a]                     
  10ac  03d8             add bx, ax                               
  10ae  66268b87bc00     mov eax, dword ptr es:[bx + 0xbc]        
  10b4  c45e06           les bx, ptr [bp + 6]                     
  10b7  66268907         mov dword ptr es:[bx], eax               
  10bb  5d               pop bp                                   
  10bc  cb               retf                                     

ovl03_10bd:  ; ENTRY
  10bd  55               push bp                                  
  10be  8bec             mov bp, sp                               
  10c0  8b5606           mov dx, word ptr [bp + 6]                
  10c3  8b4e08           mov cx, word ptr [bp + 8]                
  10c6  8bc1             mov ax, cx                               
  10c8  6bc070           imul ax, ax, 0x70                        
  10cb  c41e8a3f         les bx, ptr [0x3f8a]                     
  10cf  03d8             add bx, ax                               
  10d1  03da             add bx, dx                               
  10d3  2680bf206103     cmp byte ptr es:[bx + 0x6120], 3         
  10d9  7503             jne 0x10de                               
  10db  e99b00           jmp 0x1179                               
  10de  8bc1             mov ax, cx                               
  10e0  6bc070           imul ax, ax, 0x70                        
  10e3  c41e8a3f         les bx, ptr [0x3f8a]                     
  10e7  03d8             add bx, ax                               
  10e9  03da             add bx, dx                               
  10eb  2680bf206101     cmp byte ptr es:[bx + 0x6120], 1         
  10f1  7503             jne 0x10f6                               
  10f3  e98300           jmp 0x1179                               
  10f6  0bd2             or dx, dx                                
  10f8  740f             je 0x1109                                
  10fa  0bc9             or cx, cx                                
  10fc  740b             je 0x1109                                
  10fe  83fa6f           cmp dx, 0x6f                             
  1101  7406             je 0x1109                                
  1103  81f99b00         cmp cx, 0x9b                             
  1107  751a             jne 0x1123                               
  1109  8bc1             mov ax, cx                               
  110b  6bc070           imul ax, ax, 0x70                        
  110e  c41e8a3f         les bx, ptr [0x3f8a]                     
  1112  03d8             add bx, ax                               
  1114  03da             add bx, dx                               
  1116  2680bf206100     cmp byte ptr es:[bx + 0x6120], 0         
  111c  7505             jne 0x1123                               
  111e  b80100           mov ax, 1                                
  1121  eb58             jmp 0x117b                               
  1123  8bc1             mov ax, cx                               
  1125  6bc070           imul ax, ax, 0x70                        
  1128  c41e8a3f         les bx, ptr [0x3f8a]                     
  112c  03d8             add bx, ax                               
  112e  03da             add bx, dx                               
  1130  2680bf216102     cmp byte ptr es:[bx + 0x6121], 2         
  1136  74e6             je 0x111e                                
  1138  8bc1             mov ax, cx                               
  113a  6bc070           imul ax, ax, 0x70                        
  113d  c41e8a3f         les bx, ptr [0x3f8a]                     
  1141  03d8             add bx, ax                               
  1143  03da             add bx, dx                               
  1145  2680bf1f6102     cmp byte ptr es:[bx + 0x611f], 2         
  114b  74d1             je 0x111e                                
  114d  8bc1             mov ax, cx                               
  114f  40               inc ax                                   
  1150  6bc070           imul ax, ax, 0x70                        
  1153  c41e8a3f         les bx, ptr [0x3f8a]                     
  1157  03d8             add bx, ax                               
  1159  03da             add bx, dx                               
  115b  2680bf206102     cmp byte ptr es:[bx + 0x6120], 2         
  1161  74bb             je 0x111e                                
  1163  8bc1             mov ax, cx                               
  1165  48               dec ax                                   
  1166  6bc070           imul ax, ax, 0x70                        
  1169  c41e8a3f         les bx, ptr [0x3f8a]                     
  116d  03d8             add bx, ax                               
  116f  03da             add bx, dx                               
  1171  2680bf206102     cmp byte ptr es:[bx + 0x6120], 2         
  1177  74a5             je 0x111e                                
  1179  33c0             xor ax, ax                               
  117b  5d               pop bp                                   
  117c  cb               retf                                     

ovl03_117d:  ; ENTRY
  117d  55               push bp                                  
  117e  8bec             mov bp, sp                               
  1180  56               push si                                  
  1181  57               push di                                  
  1182  8b7606           mov si, word ptr [bp + 6]                
  1185  8b7e08           mov di, word ptr [bp + 8]                
  1188  33c9             xor cx, cx                               
  118a  eb5e             jmp 0x11ea                               
  118c  8bc1             mov ax, cx                               
  118e  c1e002           shl ax, 2                                
  1191  c41e8a3f         les bx, ptr [0x3f8a]                     
  1195  03d8             add bx, ax                               
  1197  8bc6             mov ax, si                               
  1199  260387bc00       add ax, word ptr es:[bx + 0xbc]          
  119e  7c49             jl 0x11e9                                
  11a0  8bc7             mov ax, di                               
  11a2  260387be00       add ax, word ptr es:[bx + 0xbe]          
  11a7  7c40             jl 0x11e9                                
  11a9  8bc6             mov ax, si                               
  11ab  260387bc00       add ax, word ptr es:[bx + 0xbc]          
  11b0  3d6f00           cmp ax, 0x6f                             
  11b3  7f34             jg 0x11e9                                
  11b5  8bc7             mov ax, di                               
  11b7  260387be00       add ax, word ptr es:[bx + 0xbe]          
  11bc  3d9b00           cmp ax, 0x9b                             
  11bf  7f28             jg 0x11e9                                
  11c1  8bc7             mov ax, di                               
  11c3  260387be00       add ax, word ptr es:[bx + 0xbe]          
  11c8  6bc070           imul ax, ax, 0x70                        
  11cb  8b168a3f         mov dx, word ptr [0x3f8a]                
  11cf  03d0             add dx, ax                               
  11d1  03d6             add dx, si                               
  11d3  06               push es                                  
  11d4  260397bc00       add dx, word ptr es:[bx + 0xbc]          
  11d9  8bda             mov bx, dx                               
  11db  07               pop es                                   
  11dc  2680bf206107     cmp byte ptr es:[bx + 0x6120], 7         
  11e2  7505             jne 0x11e9                               
  11e4  b80100           mov ax, 1                                
  11e7  eb08             jmp 0x11f1                               
  11e9  41               inc cx                                   
  11ea  83f908           cmp cx, 8                                
  11ed  7c9d             jl 0x118c                                
  11ef  33c0             xor ax, ax                               
  11f1  5f               pop di                                   
  11f2  5e               pop si                                   
  11f3  5d               pop bp                                   
  11f4  cb               retf                                     

ovl03_11f5:  ; ENTRY
  11f5  55               push bp                                  
  11f6  8bec             mov bp, sp                               
  11f8  56               push si                                  
  11f9  57               push di                                  
  11fa  8b7606           mov si, word ptr [bp + 6]                
  11fd  8b7e08           mov di, word ptr [bp + 8]                
  1200  33c9             xor cx, cx                               
  1202  eb61             jmp 0x1265                               
  1204  8bc1             mov ax, cx                               
  1206  c1e002           shl ax, 2                                
  1209  c41e8a3f         les bx, ptr [0x3f8a]                     
  120d  03d8             add bx, ax                               
  120f  8bc6             mov ax, si                               
  1211  260387bc00       add ax, word ptr es:[bx + 0xbc]          
  1216  7c4c             jl 0x1264                                
  1218  8bc7             mov ax, di                               
  121a  260387be00       add ax, word ptr es:[bx + 0xbe]          
  121f  7c43             jl 0x1264                                
  1221  8bc6             mov ax, si                               
  1223  260387bc00       add ax, word ptr es:[bx + 0xbc]          
  1228  3d6f00           cmp ax, 0x6f                             
  122b  7f37             jg 0x1264                                
  122d  8bc7             mov ax, di                               
  122f  260387be00       add ax, word ptr es:[bx + 0xbe]          
  1234  3d9b00           cmp ax, 0x9b                             
  1237  7f2b             jg 0x1264                                
  1239  8bc7             mov ax, di                               
  123b  260387be00       add ax, word ptr es:[bx + 0xbe]          
  1240  6bc070           imul ax, ax, 0x70                        
  1243  8b168a3f         mov dx, word ptr [0x3f8a]                
  1247  03d0             add dx, ax                               
  1249  03d6             add dx, si                               
  124b  06               push es                                  
  124c  260397bc00       add dx, word ptr es:[bx + 0xbc]          
  1251  8bda             mov bx, dx                               
  1253  07               pop es                                   
  1254  268a872061       mov al, byte ptr es:[bx + 0x6120]        
  1259  98               cwde                                     
  125a  3b460a           cmp ax, word ptr [bp + 0xa]              
  125d  7505             jne 0x1264                               
  125f  b80100           mov ax, 1                                
  1262  eb08             jmp 0x126c                               
  1264  41               inc cx                                   
  1265  83f908           cmp cx, 8                                
  1268  7c9a             jl 0x1204                                
  126a  33c0             xor ax, ax                               
  126c  5f               pop di                                   
  126d  5e               pop si                                   
  126e  5d               pop bp                                   
  126f  cb               retf                                     
