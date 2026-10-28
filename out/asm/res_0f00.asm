; res_0f00 file_off 0x11000
  000c  c8080000         enter 8, 0                               
  0010  56               push si                                  
  0011  57               push di                                  
  0012  c646fd01         mov byte ptr [bp - 3], 1                 
  0016  c45e06           les bx, ptr [bp + 6]                     
  0019  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  001f  7449             je 0x6a                                  
  0021  c45e06           les bx, ptr [bp + 6]                     
  0024  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  002a  753e             jne 0x6a                                 
  002c  33ff             xor di, di                               
  002e  eb2d             jmp 0x5d                                 
  0030  8bc7             mov ax, di                               
  0032  c1e002           shl ax, 2                                
  0035  c45e06           les bx, ptr [bp + 6]                     
  0038  03d8             add bx, ax                               
  003a  26ff770c         push word ptr es:[bx + 0xc]              
  003e  26ff770a         push word ptr es:[bx + 0xa]              
  0042  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0047  83c404           add sp, 4                                
  004a  8bdf             mov bx, di                               
  004c  c1e302           shl bx, 2                                
  004f  c47606           les si, ptr [bp + 6]                     
  0052  03f3             add si, bx                               
  0054  2689541c         mov word ptr es:[si + 0x1c], dx          
  0058  2689441a         mov word ptr es:[si + 0x1a], ax          
  005c  47               inc di                                   
  005d  c45e06           les bx, ptr [bp + 6]                     
  0060  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0064  b400             mov ah, 0                                
  0066  3bc7             cmp ax, di                               
  0068  7fc6             jg 0x30                                  
  006a  8b460a           mov ax, word ptr [bp + 0xa]              
  006d  250700           and ax, 7                                
  0070  ba0700           mov dx, 7                                
  0073  2bd0             sub dx, ax                               
  0075  8956fe           mov word ptr [bp - 2], dx                
  0078  33f6             xor si, si                               
  007a  e9c900           jmp 0x146                                
  007d  56               push si                                  
  007e  9a1800680e       lcall 0xe68, 0x18                        -> 0e68:0018
  0083  59               pop cx                                   
  0084  c45e06           les bx, ptr [bp + 6]                     
  0087  26f747350100     test word ptr es:[bx + 0x35], 1          
  008d  744e             je 0xdd                                  
  008f  c45e06           les bx, ptr [bp + 6]                     
  0092  268b4706         mov ax, word ptr es:[bx + 6]             
  0096  3b460c           cmp ax, word ptr [bp + 0xc]              
  0099  7f42             jg 0xdd                                  
  009b  c45e06           les bx, ptr [bp + 6]                     
  009e  26c45f37         les bx, ptr es:[bx + 0x37]               
  00a2  8bc6             mov ax, si                               
  00a4  c1e002           shl ax, 2                                
  00a7  03d8             add bx, ax                               
  00a9  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  00ad  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  00b1  c45e06           les bx, ptr [bp + 6]                     
  00b4  52               push dx                                  
  00b5  50               push ax                                  
  00b6  8b460c           mov ax, word ptr [bp + 0xc]              
  00b9  262b4706         sub ax, word ptr es:[bx + 6]             
  00bd  c45e06           les bx, ptr [bp + 6]                     
  00c0  26c45f37         les bx, ptr es:[bx + 0x37]               
  00c4  26f76f08         imul word ptr es:[bx + 8]                
  00c8  d1e0             shl ax, 1                                
  00ca  8bd0             mov dx, ax                               
  00cc  58               pop ax                                   
  00cd  03c2             add ax, dx                               
  00cf  8b560a           mov dx, word ptr [bp + 0xa]              
  00d2  8a0e9e69         mov cl, byte ptr [0x699e]                
  00d6  d3fa             sar dx, cl                               
  00d8  03c2             add ax, dx                               
  00da  5a               pop dx                                   
  00db  eb31             jmp 0x10e                                
  00dd  8bc6             mov ax, si                               
  00df  c1e002           shl ax, 2                                
  00e2  c45e06           les bx, ptr [bp + 6]                     
  00e5  03d8             add bx, ax                               
  00e7  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  00eb  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  00ef  c45e06           les bx, ptr [bp + 6]                     
  00f2  52               push dx                                  
  00f3  50               push ax                                  
  00f4  8b460c           mov ax, word ptr [bp + 0xc]              
  00f7  26f76f08         imul word ptr es:[bx + 8]                
  00fb  d1e0             shl ax, 1                                
  00fd  8bd0             mov dx, ax                               
  00ff  58               pop ax                                   
  0100  03c2             add ax, dx                               
  0102  8b560a           mov dx, word ptr [bp + 0xa]              
  0105  8a0e9e69         mov cl, byte ptr [0x699e]                
  0109  d3fa             sar dx, cl                               
  010b  03c2             add ax, dx                               
  010d  5a               pop dx                                   
  010e  8956fa           mov word ptr [bp - 6], dx                
  0111  8946f8           mov word ptr [bp - 8], ax                
  0114  8a46fd           mov al, byte ptr [bp - 3]                
  0117  b400             mov ah, 0                                
  0119  85460e           test word ptr [bp + 0xe], ax             
  011c  7404             je 0x122                                 
  011e  b001             mov al, 1                                
  0120  eb02             jmp 0x124                                
  0122  b000             mov al, 0                                
  0124  8a4efe           mov cl, byte ptr [bp - 2]                
  0127  d2e0             shl al, cl                               
  0129  c45ef8           les bx, ptr [bp - 8]                     
  012c  268a17           mov dl, byte ptr es:[bx]                 
  012f  b301             mov bl, 1                                
  0131  8a4efe           mov cl, byte ptr [bp - 2]                
  0134  d2e3             shl bl, cl                               
  0136  f6d3             not bl                                   
  0138  22d3             and dl, bl                               
  013a  0ad0             or dl, al                                
  013c  c45ef8           les bx, ptr [bp - 8]                     
  013f  268817           mov byte ptr es:[bx], dl                 
  0142  d066fd           shl byte ptr [bp - 3], 1                 
  0145  46               inc si                                   
  0146  c45e06           les bx, ptr [bp + 6]                     
  0149  268a4734         mov al, byte ptr es:[bx + 0x34]          
  014d  b400             mov ah, 0                                
  014f  3bc6             cmp ax, si                               
  0151  7e03             jle 0x156                                
  0153  e927ff           jmp 0x7d                                 
  0156  c45e06           les bx, ptr [bp + 6]                     
  0159  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  015f  7437             je 0x198                                 
  0161  c45e06           les bx, ptr [bp + 6]                     
  0164  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  016a  752c             jne 0x198                                
  016c  33f6             xor si, si                               
  016e  eb1b             jmp 0x18b                                
  0170  8bc6             mov ax, si                               
  0172  c1e002           shl ax, 2                                
  0175  c45e06           les bx, ptr [bp + 6]                     
  0178  03d8             add bx, ax                               
  017a  26ff770c         push word ptr es:[bx + 0xc]              
  017e  26ff770a         push word ptr es:[bx + 0xa]              
  0182  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0187  83c404           add sp, 4                                
  018a  46               inc si                                   
  018b  c45e06           les bx, ptr [bp + 6]                     
  018e  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0192  b400             mov ah, 0                                
  0194  3bc6             cmp ax, si                               
  0196  7fd8             jg 0x170                                 
  0198  5f               pop di                                   
  0199  5e               pop si                                   
  019a  c9               leave                                    
  019b  cb               retf                                     
  019c  c80c0000         enter 0xc, 0                             
  01a0  56               push si                                  
  01a1  57               push di                                  
  01a2  c746fe0000       mov word ptr [bp - 2], 0                 
  01a7  c746fc0000       mov word ptr [bp - 4], 0                 
  01ac  c45e06           les bx, ptr [bp + 6]                     
  01af  268b4704         mov ax, word ptr es:[bx + 4]             
  01b3  c41ee734         les bx, ptr [0x34e7]                     
  01b7  263b4704         cmp ax, word ptr es:[bx + 4]             
  01bb  7216             jb 0x1d3                                 
  01bd  c45e06           les bx, ptr [bp + 6]                     
  01c0  268b4706         mov ax, word ptr es:[bx + 6]             
  01c4  c41ee734         les bx, ptr [0x34e7]                     
  01c8  263b4706         cmp ax, word ptr es:[bx + 6]             
  01cc  7205             jb 0x1d3                                 
  01ce  b80100           mov ax, 1                                
  01d1  eb02             jmp 0x1d5                                
  01d3  33c0             xor ax, ax                               
  01d5  8946f4           mov word ptr [bp - 0xc], ax              
  01d8  837ef400         cmp word ptr [bp - 0xc], 0               
  01dc  7554             jne 0x232                                
  01de  c45e06           les bx, ptr [bp + 6]                     
  01e1  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  01e7  7449             je 0x232                                 
  01e9  c45e06           les bx, ptr [bp + 6]                     
  01ec  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  01f2  753e             jne 0x232                                
  01f4  33ff             xor di, di                               
  01f6  eb2d             jmp 0x225                                
  01f8  8bc7             mov ax, di                               
  01fa  c1e002           shl ax, 2                                
  01fd  c45e06           les bx, ptr [bp + 6]                     
  0200  03d8             add bx, ax                               
  0202  26ff770c         push word ptr es:[bx + 0xc]              
  0206  26ff770a         push word ptr es:[bx + 0xa]              
  020a  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  020f  83c404           add sp, 4                                
  0212  8bdf             mov bx, di                               
  0214  c1e302           shl bx, 2                                
  0217  c47606           les si, ptr [bp + 6]                     
  021a  03f3             add si, bx                               
  021c  2689541c         mov word ptr es:[si + 0x1c], dx          
  0220  2689441a         mov word ptr es:[si + 0x1a], ax          
  0224  47               inc di                                   
  0225  c45e06           les bx, ptr [bp + 6]                     
  0228  268a4734         mov al, byte ptr es:[bx + 0x34]          
  022c  b400             mov ah, 0                                
  022e  3bc7             cmp ax, di                               
  0230  7fc6             jg 0x1f8                                 
  0232  8a460a           mov al, byte ptr [bp + 0xa]              
  0235  2407             and al, 7                                
  0237  b107             mov cl, 7                                
  0239  2ac8             sub cl, al                               
  023b  b001             mov al, 1                                
  023d  d2e0             shl al, cl                               
  023f  8846fb           mov byte ptr [bp - 5], al                
  0242  33ff             xor di, di                               
  0244  e94101           jmp 0x388                                
  0247  837ef400         cmp word ptr [bp - 0xc], 0               
  024b  744b             je 0x298                                 
  024d  8bc7             mov ax, di                               
  024f  c1e002           shl ax, 2                                
  0252  c45e06           les bx, ptr [bp + 6]                     
  0255  03d8             add bx, ax                               
  0257  268b470a         mov ax, word ptr es:[bx + 0xa]           
  025b  260b470c         or ax, word ptr es:[bx + 0xc]            
  025f  7437             je 0x298                                 
  0261  c45e06           les bx, ptr [bp + 6]                     
  0264  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  026a  752c             jne 0x298                                
  026c  8bc7             mov ax, di                               
  026e  c1e002           shl ax, 2                                
  0271  c45e06           les bx, ptr [bp + 6]                     
  0274  03d8             add bx, ax                               
  0276  26ff770c         push word ptr es:[bx + 0xc]              
  027a  26ff770a         push word ptr es:[bx + 0xa]              
  027e  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0283  83c404           add sp, 4                                
  0286  8bdf             mov bx, di                               
  0288  c1e302           shl bx, 2                                
  028b  c47606           les si, ptr [bp + 6]                     
  028e  03f3             add si, bx                               
  0290  2689541c         mov word ptr es:[si + 0x1c], dx          
  0294  2689441a         mov word ptr es:[si + 0x1a], ax          
  0298  57               push di                                  
  0299  9a1800680e       lcall 0xe68, 0x18                        -> 0e68:0018
  029e  59               pop cx                                   
  029f  c45e06           les bx, ptr [bp + 6]                     
  02a2  26f747350100     test word ptr es:[bx + 0x35], 1          
  02a8  744e             je 0x2f8                                 
  02aa  c45e06           les bx, ptr [bp + 6]                     
  02ad  268b4706         mov ax, word ptr es:[bx + 6]             
  02b1  3b460c           cmp ax, word ptr [bp + 0xc]              
  02b4  7f42             jg 0x2f8                                 
  02b6  c45e06           les bx, ptr [bp + 6]                     
  02b9  26c45f37         les bx, ptr es:[bx + 0x37]               
  02bd  8bc7             mov ax, di                               
  02bf  c1e002           shl ax, 2                                
  02c2  03d8             add bx, ax                               
  02c4  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  02c8  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  02cc  c45e06           les bx, ptr [bp + 6]                     
  02cf  52               push dx                                  
  02d0  50               push ax                                  
  02d1  8b460c           mov ax, word ptr [bp + 0xc]              
  02d4  262b4706         sub ax, word ptr es:[bx + 6]             
  02d8  c45e06           les bx, ptr [bp + 6]                     
  02db  26c45f37         les bx, ptr es:[bx + 0x37]               
  02df  26f76f08         imul word ptr es:[bx + 8]                
  02e3  d1e0             shl ax, 1                                
  02e5  8bd0             mov dx, ax                               
  02e7  58               pop ax                                   
  02e8  03c2             add ax, dx                               
  02ea  8b560a           mov dx, word ptr [bp + 0xa]              
  02ed  8a0e9e69         mov cl, byte ptr [0x699e]                
  02f1  d3fa             sar dx, cl                               
  02f3  03c2             add ax, dx                               
  02f5  5a               pop dx                                   
  02f6  eb31             jmp 0x329                                
  02f8  8bc7             mov ax, di                               
  02fa  c1e002           shl ax, 2                                
  02fd  c45e06           les bx, ptr [bp + 6]                     
  0300  03d8             add bx, ax                               
  0302  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  0306  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  030a  c45e06           les bx, ptr [bp + 6]                     
  030d  52               push dx                                  
  030e  50               push ax                                  
  030f  8b460c           mov ax, word ptr [bp + 0xc]              
  0312  26f76f08         imul word ptr es:[bx + 8]                
  0316  d1e0             shl ax, 1                                
  0318  8bd0             mov dx, ax                               
  031a  58               pop ax                                   
  031b  03c2             add ax, dx                               
  031d  8b560a           mov dx, word ptr [bp + 0xa]              
  0320  8a0e9e69         mov cl, byte ptr [0x699e]                
  0324  d3fa             sar dx, cl                               
  0326  03c2             add ax, dx                               
  0328  5a               pop dx                                   
  0329  8956f8           mov word ptr [bp - 8], dx                
  032c  8946f6           mov word ptr [bp - 0xa], ax              
  032f  8b4efe           mov cx, word ptr [bp - 2]                
  0332  51               push cx                                  
  0333  c45ef6           les bx, ptr [bp - 0xa]                   
  0336  8a46fb           mov al, byte ptr [bp - 5]                
  0339  268407           test byte ptr es:[bx], al                
  033c  7405             je 0x343                                 
  033e  b80100           mov ax, 1                                
  0341  eb02             jmp 0x345                                
  0343  33c0             xor ax, ax                               
  0345  59               pop cx                                   
  0346  d3e0             shl ax, cl                               
  0348  0946fc           or word ptr [bp - 4], ax                 
  034b  ff46fe           inc word ptr [bp - 2]                    
  034e  8bc7             mov ax, di                               
  0350  c1e002           shl ax, 2                                
  0353  c45e06           les bx, ptr [bp + 6]                     
  0356  03d8             add bx, ax                               
  0358  268b470a         mov ax, word ptr es:[bx + 0xa]           
  035c  260b470c         or ax, word ptr es:[bx + 0xc]            
  0360  7425             je 0x387                                 
  0362  c45e06           les bx, ptr [bp + 6]                     
  0365  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  036b  751a             jne 0x387                                
  036d  8bc7             mov ax, di                               
  036f  c1e002           shl ax, 2                                
  0372  c45e06           les bx, ptr [bp + 6]                     
  0375  03d8             add bx, ax                               
  0377  26ff770c         push word ptr es:[bx + 0xc]              
  037b  26ff770a         push word ptr es:[bx + 0xa]              
  037f  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0384  83c404           add sp, 4                                
  0387  47               inc di                                   
  0388  c45e06           les bx, ptr [bp + 6]                     
  038b  268a4734         mov al, byte ptr es:[bx + 0x34]          
  038f  b400             mov ah, 0                                
  0391  3bc7             cmp ax, di                               
  0393  7e03             jle 0x398                                
  0395  e9affe           jmp 0x247                                
  0398  8b46fc           mov ax, word ptr [bp - 4]                
  039b  eb00             jmp 0x39d                                
  039d  5f               pop di                                   
  039e  5e               pop si                                   
  039f  c9               leave                                    
  03a0  cb               retf                                     
  03a1  c8120000         enter 0x12, 0                            
  03a5  56               push si                                  
  03a6  57               push di                                  
  03a7  8b7e0e           mov di, word ptr [bp + 0xe]              
  03aa  c746f20000       mov word ptr [bp - 0xe], 0               
  03af  c746f00000       mov word ptr [bp - 0x10], 0              
  03b4  c45e06           les bx, ptr [bp + 6]                     
  03b7  268b4704         mov ax, word ptr es:[bx + 4]             
  03bb  c41ee734         les bx, ptr [0x34e7]                     
  03bf  263b4704         cmp ax, word ptr es:[bx + 4]             
  03c3  7216             jb 0x3db                                 
  03c5  c45e06           les bx, ptr [bp + 6]                     
  03c8  268b4706         mov ax, word ptr es:[bx + 6]             
  03cc  c41ee734         les bx, ptr [0x34e7]                     
  03d0  263b4706         cmp ax, word ptr es:[bx + 6]             
  03d4  7205             jb 0x3db                                 
  03d6  b80100           mov ax, 1                                
  03d9  eb02             jmp 0x3dd                                
  03db  33c0             xor ax, ax                               
  03dd  8946f4           mov word ptr [bp - 0xc], ax              
  03e0  837ef400         cmp word ptr [bp - 0xc], 0               
  03e4  755c             jne 0x442                                
  03e6  c45e06           les bx, ptr [bp + 6]                     
  03e9  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  03ef  7451             je 0x442                                 
  03f1  c45e06           les bx, ptr [bp + 6]                     
  03f4  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  03fa  7546             jne 0x442                                
  03fc  c746ee0000       mov word ptr [bp - 0x12], 0              
  0401  eb31             jmp 0x434                                
  0403  8b46ee           mov ax, word ptr [bp - 0x12]             
  0406  c1e002           shl ax, 2                                
  0409  c45e06           les bx, ptr [bp + 6]                     
  040c  03d8             add bx, ax                               
  040e  26ff770c         push word ptr es:[bx + 0xc]              
  0412  26ff770a         push word ptr es:[bx + 0xa]              
  0416  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  041b  83c404           add sp, 4                                
  041e  8b5eee           mov bx, word ptr [bp - 0x12]             
  0421  c1e302           shl bx, 2                                
  0424  c47606           les si, ptr [bp + 6]                     
  0427  03f3             add si, bx                               
  0429  2689541c         mov word ptr es:[si + 0x1c], dx          
  042d  2689441a         mov word ptr es:[si + 0x1a], ax          
  0431  ff46ee           inc word ptr [bp - 0x12]                 
  0434  c45e06           les bx, ptr [bp + 6]                     
  0437  268a4734         mov al, byte ptr es:[bx + 0x34]          
  043b  b400             mov ah, 0                                
  043d  3b46ee           cmp ax, word ptr [bp - 0x12]             
  0440  7fc1             jg 0x403                                 
  0442  f7460a0700       test word ptr [bp + 0xa], 7              
  0447  750d             jne 0x456                                
  0449  f7c70700         test di, 7                               
  044d  7507             jne 0x456                                
  044f  f746160700       test word ptr [bp + 0x16], 7             
  0454  7427             je 0x47d                                 
  0456  ff7618           push word ptr [bp + 0x18]                
  0459  ff7616           push word ptr [bp + 0x16]                
  045c  ff7614           push word ptr [bp + 0x14]                
  045f  ff7612           push word ptr [bp + 0x12]                
  0462  ff7610           push word ptr [bp + 0x10]                
  0465  57               push di                                  
  0466  ff760c           push word ptr [bp + 0xc]                 
  0469  ff760a           push word ptr [bp + 0xa]                 
  046c  ff7608           push word ptr [bp + 8]                   
  046f  ff7606           push word ptr [bp + 6]                   
  0472  90               nop                                      
  0473  0e               push cs                                  
  0474  e80d04           call 0x884                               
  0477  83c414           add sp, 0x14                             
  047a  e90304           jmp 0x880                                
  047d  8a0e9e69         mov cl, byte ptr [0x699e]                
  0481  d3ff             sar di, cl                               
  0483  8bc7             mov ax, di                               
  0485  99               cdq                                      
  0486  2bc2             sub ax, dx                               
  0488  d1f8             sar ax, 1                                
  048a  50               push ax                                  
  048b  8bc7             mov ax, di                               
  048d  40               inc ax                                   
  048e  99               cdq                                      
  048f  2bc2             sub ax, dx                               
  0491  d1f8             sar ax, 1                                
  0493  5a               pop dx                                   
  0494  3bd0             cmp dx, ax                               
  0496  7505             jne 0x49d                                
  0498  b80100           mov ax, 1                                
  049b  eb02             jmp 0x49f                                
  049d  33c0             xor ax, ax                               
  049f  8946f2           mov word ptr [bp - 0xe], ax              
  04a2  8bc7             mov ax, di                               
  04a4  bb0400           mov bx, 4                                
  04a7  99               cdq                                      
  04a8  f7fb             idiv bx                                  
  04aa  50               push ax                                  
  04ab  8bc7             mov ax, di                               
  04ad  050300           add ax, 3                                
  04b0  bb0400           mov bx, 4                                
  04b3  99               cdq                                      
  04b4  f7fb             idiv bx                                  
  04b6  5a               pop dx                                   
  04b7  3bd0             cmp dx, ax                               
  04b9  7505             jne 0x4c0                                
  04bb  b80100           mov ax, 1                                
  04be  eb02             jmp 0x4c2                                
  04c0  33c0             xor ax, ax                               
  04c2  8946f0           mov word ptr [bp - 0x10], ax             
  04c5  c45e06           les bx, ptr [bp + 6]                     
  04c8  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  04cd  c45e06           les bx, ptr [bp + 6]                     
  04d0  66263b471e       cmp eax, dword ptr es:[bx + 0x1e]        
  04d5  7403             je 0x4da                                 
  04d7  e95c01           jmp 0x636                                
  04da  c45e12           les bx, ptr [bp + 0x12]                  
  04dd  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  04e2  c45e12           les bx, ptr [bp + 0x12]                  
  04e5  66263b471e       cmp eax, dword ptr es:[bx + 0x1e]        
  04ea  7403             je 0x4ef                                 
  04ec  e94701           jmp 0x636                                
  04ef  6a01             push 1                                   
  04f1  9a4700680e       lcall 0xe68, 0x47                        -> 0e68:0047
  04f6  59               pop cx                                   
  04f7  9a3a00680e       lcall 0xe68, 0x3a                        -> 0e68:003a
  04fc  c45e06           les bx, ptr [bp + 6]                     
  04ff  26f747350100     test word ptr es:[bx + 0x35], 1          
  0505  7443             je 0x54a                                 
  0507  c45e06           les bx, ptr [bp + 6]                     
  050a  268b4706         mov ax, word ptr es:[bx + 6]             
  050e  3b460c           cmp ax, word ptr [bp + 0xc]              
  0511  7f37             jg 0x54a                                 
  0513  c45e06           les bx, ptr [bp + 6]                     
  0516  8b460c           mov ax, word ptr [bp + 0xc]              
  0519  262b4706         sub ax, word ptr es:[bx + 6]             
  051d  c45e06           les bx, ptr [bp + 6]                     
  0520  26c45f37         les bx, ptr es:[bx + 0x37]               
  0524  26f76f08         imul word ptr es:[bx + 8]                
  0528  d1e0             shl ax, 1                                
  052a  c45e06           les bx, ptr [bp + 6]                     
  052d  26c45f37         les bx, ptr es:[bx + 0x37]               
  0531  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  0535  50               push ax                                  
  0536  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  053a  5b               pop bx                                   
  053b  03c3             add ax, bx                               
  053d  8b5e0a           mov bx, word ptr [bp + 0xa]              
  0540  8a0e9e69         mov cl, byte ptr [0x699e]                
  0544  d3fb             sar bx, cl                               
  0546  03c3             add ax, bx                               
  0548  eb2a             jmp 0x574                                
  054a  c45e06           les bx, ptr [bp + 6]                     
  054d  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  0551  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  0555  c45e06           les bx, ptr [bp + 6]                     
  0558  52               push dx                                  
  0559  50               push ax                                  
  055a  8b460c           mov ax, word ptr [bp + 0xc]              
  055d  26f76f08         imul word ptr es:[bx + 8]                
  0561  d1e0             shl ax, 1                                
  0563  8bd0             mov dx, ax                               
  0565  58               pop ax                                   
  0566  03c2             add ax, dx                               
  0568  8b560a           mov dx, word ptr [bp + 0xa]              
  056b  8a0e9e69         mov cl, byte ptr [0x699e]                
  056f  d3fa             sar dx, cl                               
  0571  03c2             add ax, dx                               
  0573  5a               pop dx                                   
  0574  8956fe           mov word ptr [bp - 2], dx                
  0577  8946fc           mov word ptr [bp - 4], ax                
  057a  c45e12           les bx, ptr [bp + 0x12]                  
  057d  26f747350100     test word ptr es:[bx + 0x35], 1          
  0583  7443             je 0x5c8                                 
  0585  c45e12           les bx, ptr [bp + 0x12]                  
  0588  268b4706         mov ax, word ptr es:[bx + 6]             
  058c  3b4618           cmp ax, word ptr [bp + 0x18]             
  058f  7f37             jg 0x5c8                                 
  0591  c45e12           les bx, ptr [bp + 0x12]                  
  0594  8b4618           mov ax, word ptr [bp + 0x18]             
  0597  262b4706         sub ax, word ptr es:[bx + 6]             
  059b  c45e12           les bx, ptr [bp + 0x12]                  
  059e  26c45f37         les bx, ptr es:[bx + 0x37]               
  05a2  26f76f08         imul word ptr es:[bx + 8]                
  05a6  d1e0             shl ax, 1                                
  05a8  c45e12           les bx, ptr [bp + 0x12]                  
  05ab  26c45f37         les bx, ptr es:[bx + 0x37]               
  05af  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  05b3  50               push ax                                  
  05b4  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  05b8  5b               pop bx                                   
  05b9  03c3             add ax, bx                               
  05bb  8b5e16           mov bx, word ptr [bp + 0x16]             
  05be  8a0e9e69         mov cl, byte ptr [0x699e]                
  05c2  d3fb             sar bx, cl                               
  05c4  03c3             add ax, bx                               
  05c6  eb2a             jmp 0x5f2                                
  05c8  c45e12           les bx, ptr [bp + 0x12]                  
  05cb  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  05cf  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  05d3  c45e12           les bx, ptr [bp + 0x12]                  
  05d6  52               push dx                                  
  05d7  50               push ax                                  
  05d8  8b4618           mov ax, word ptr [bp + 0x18]             
  05db  26f76f08         imul word ptr es:[bx + 8]                
  05df  d1e0             shl ax, 1                                
  05e1  8bd0             mov dx, ax                               
  05e3  58               pop ax                                   
  05e4  03c2             add ax, dx                               
  05e6  8b5616           mov dx, word ptr [bp + 0x16]             
  05e9  8a0e9e69         mov cl, byte ptr [0x699e]                
  05ed  d3fa             sar dx, cl                               
  05ef  03c2             add ax, dx                               
  05f1  5a               pop dx                                   
  05f2  8956fa           mov word ptr [bp - 6], dx                
  05f5  8946f8           mov word ptr [bp - 8], ax                
  05f8  c45e06           les bx, ptr [bp + 6]                     
  05fb  268b4708         mov ax, word ptr es:[bx + 8]             
  05ff  d1e0             shl ax, 1                                
  0601  2bc7             sub ax, di                               
  0603  8bd0             mov dx, ax                               
  0605  c45e12           les bx, ptr [bp + 0x12]                  
  0608  268b4708         mov ax, word ptr es:[bx + 8]             
  060c  d1e0             shl ax, 1                                
  060e  2bc7             sub ax, di                               
  0610  8bd8             mov bx, ax                               
  0612  53               push bx                                  
  0613  52               push dx                                  
  0614  57               push di                                  
  0615  ff7610           push word ptr [bp + 0x10]                
  0618  ff76fa           push word ptr [bp - 6]                   
  061b  ff76f8           push word ptr [bp - 8]                   
  061e  ff76fe           push word ptr [bp - 2]                   
  0621  ff76fc           push word ptr [bp - 4]                   
  0624  ff1ec469         lcall [0x69c4]                           
  0628  83c410           add sp, 0x10                             
  062b  6a00             push 0                                   
  062d  9a4700680e       lcall 0xe68, 0x47                        -> 0e68:0047
  0632  59               pop cx                                   
  0633  e94a02           jmp 0x880                                
  0636  c746f60000       mov word ptr [bp - 0xa], 0               
  063b  e93102           jmp 0x86f                                
  063e  837ef400         cmp word ptr [bp - 0xc], 0               
  0642  744e             je 0x692                                 
  0644  8b46f6           mov ax, word ptr [bp - 0xa]              
  0647  c1e002           shl ax, 2                                
  064a  c45e06           les bx, ptr [bp + 6]                     
  064d  03d8             add bx, ax                               
  064f  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0653  260b470c         or ax, word ptr es:[bx + 0xc]            
  0657  7439             je 0x692                                 
  0659  c45e06           les bx, ptr [bp + 6]                     
  065c  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0662  752e             jne 0x692                                
  0664  8b46f6           mov ax, word ptr [bp - 0xa]              
  0667  c1e002           shl ax, 2                                
  066a  c45e06           les bx, ptr [bp + 6]                     
  066d  03d8             add bx, ax                               
  066f  26ff770c         push word ptr es:[bx + 0xc]              
  0673  26ff770a         push word ptr es:[bx + 0xa]              
  0677  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  067c  83c404           add sp, 4                                
  067f  8b5ef6           mov bx, word ptr [bp - 0xa]              
  0682  c1e302           shl bx, 2                                
  0685  c47606           les si, ptr [bp + 6]                     
  0688  03f3             add si, bx                               
  068a  2689541c         mov word ptr es:[si + 0x1c], dx          
  068e  2689441a         mov word ptr es:[si + 0x1a], ax          
  0692  ff76f6           push word ptr [bp - 0xa]                 
  0695  9a1800680e       lcall 0xe68, 0x18                        -> 0e68:0018
  069a  59               pop cx                                   
  069b  c45e06           les bx, ptr [bp + 6]                     
  069e  26f747350100     test word ptr es:[bx + 0x35], 1          
  06a4  744f             je 0x6f5                                 
  06a6  c45e06           les bx, ptr [bp + 6]                     
  06a9  268b4706         mov ax, word ptr es:[bx + 6]             
  06ad  3b460c           cmp ax, word ptr [bp + 0xc]              
  06b0  7f43             jg 0x6f5                                 
  06b2  c45e06           les bx, ptr [bp + 6]                     
  06b5  26c45f37         les bx, ptr es:[bx + 0x37]               
  06b9  8b46f6           mov ax, word ptr [bp - 0xa]              
  06bc  c1e002           shl ax, 2                                
  06bf  03d8             add bx, ax                               
  06c1  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  06c5  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  06c9  c45e06           les bx, ptr [bp + 6]                     
  06cc  52               push dx                                  
  06cd  50               push ax                                  
  06ce  8b460c           mov ax, word ptr [bp + 0xc]              
  06d1  262b4706         sub ax, word ptr es:[bx + 6]             
  06d5  c45e06           les bx, ptr [bp + 6]                     
  06d8  26c45f37         les bx, ptr es:[bx + 0x37]               
  06dc  26f76f08         imul word ptr es:[bx + 8]                
  06e0  d1e0             shl ax, 1                                
  06e2  8bd0             mov dx, ax                               
  06e4  58               pop ax                                   
  06e5  03c2             add ax, dx                               
  06e7  8b560a           mov dx, word ptr [bp + 0xa]              
  06ea  8a0e9e69         mov cl, byte ptr [0x699e]                
  06ee  d3fa             sar dx, cl                               
  06f0  03c2             add ax, dx                               
  06f2  5a               pop dx                                   
  06f3  eb32             jmp 0x727                                
  06f5  8b46f6           mov ax, word ptr [bp - 0xa]              
  06f8  c1e002           shl ax, 2                                
  06fb  c45e06           les bx, ptr [bp + 6]                     
  06fe  03d8             add bx, ax                               
  0700  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  0704  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  0708  c45e06           les bx, ptr [bp + 6]                     
  070b  52               push dx                                  
  070c  50               push ax                                  
  070d  8b460c           mov ax, word ptr [bp + 0xc]              
  0710  26f76f08         imul word ptr es:[bx + 8]                
  0714  d1e0             shl ax, 1                                
  0716  8bd0             mov dx, ax                               
  0718  58               pop ax                                   
  0719  03c2             add ax, dx                               
  071b  8b560a           mov dx, word ptr [bp + 0xa]              
  071e  8a0e9e69         mov cl, byte ptr [0x699e]                
  0722  d3fa             sar dx, cl                               
  0724  03c2             add ax, dx                               
  0726  5a               pop dx                                   
  0727  8956fe           mov word ptr [bp - 2], dx                
  072a  8946fc           mov word ptr [bp - 4], ax                
  072d  c45e12           les bx, ptr [bp + 0x12]                  
  0730  26f747350100     test word ptr es:[bx + 0x35], 1          
  0736  744f             je 0x787                                 
  0738  c45e12           les bx, ptr [bp + 0x12]                  
  073b  268b4706         mov ax, word ptr es:[bx + 6]             
  073f  3b4618           cmp ax, word ptr [bp + 0x18]             
  0742  7f43             jg 0x787                                 
  0744  c45e12           les bx, ptr [bp + 0x12]                  
  0747  26c45f37         les bx, ptr es:[bx + 0x37]               
  074b  8b46f6           mov ax, word ptr [bp - 0xa]              
  074e  c1e002           shl ax, 2                                
  0751  03d8             add bx, ax                               
  0753  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  0757  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  075b  c45e12           les bx, ptr [bp + 0x12]                  
  075e  52               push dx                                  
  075f  50               push ax                                  
  0760  8b4618           mov ax, word ptr [bp + 0x18]             
  0763  262b4706         sub ax, word ptr es:[bx + 6]             
  0767  c45e12           les bx, ptr [bp + 0x12]                  
  076a  26c45f37         les bx, ptr es:[bx + 0x37]               
  076e  26f76f08         imul word ptr es:[bx + 8]                
  0772  d1e0             shl ax, 1                                
  0774  8bd0             mov dx, ax                               
  0776  58               pop ax                                   
  0777  03c2             add ax, dx                               
  0779  8b5616           mov dx, word ptr [bp + 0x16]             
  077c  8a0e9e69         mov cl, byte ptr [0x699e]                
  0780  d3fa             sar dx, cl                               
  0782  03c2             add ax, dx                               
  0784  5a               pop dx                                   
  0785  eb32             jmp 0x7b9                                
  0787  8b46f6           mov ax, word ptr [bp - 0xa]              
  078a  c1e002           shl ax, 2                                
  078d  c45e12           les bx, ptr [bp + 0x12]                  
  0790  03d8             add bx, ax                               
  0792  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  0796  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  079a  c45e12           les bx, ptr [bp + 0x12]                  
  079d  52               push dx                                  
  079e  50               push ax                                  
  079f  8b4618           mov ax, word ptr [bp + 0x18]             
  07a2  26f76f08         imul word ptr es:[bx + 8]                
  07a6  d1e0             shl ax, 1                                
  07a8  8bd0             mov dx, ax                               
  07aa  58               pop ax                                   
  07ab  03c2             add ax, dx                               
  07ad  8b5616           mov dx, word ptr [bp + 0x16]             
  07b0  8a0e9e69         mov cl, byte ptr [0x699e]                
  07b4  d3fa             sar dx, cl                               
  07b6  03c2             add ax, dx                               
  07b8  5a               pop dx                                   
  07b9  8956fa           mov word ptr [bp - 6], dx                
  07bc  8946f8           mov word ptr [bp - 8], ax                
  07bf  c45e06           les bx, ptr [bp + 6]                     
  07c2  268b4708         mov ax, word ptr es:[bx + 8]             
  07c6  d1e0             shl ax, 1                                
  07c8  2bc7             sub ax, di                               
  07ca  8bd0             mov dx, ax                               
  07cc  c45e12           les bx, ptr [bp + 0x12]                  
  07cf  268b4708         mov ax, word ptr es:[bx + 8]             
  07d3  d1e0             shl ax, 1                                
  07d5  2bc7             sub ax, di                               
  07d7  8bd8             mov bx, ax                               
  07d9  837ef000         cmp word ptr [bp - 0x10], 0              
  07dd  741b             je 0x7fa                                 
  07df  53               push bx                                  
  07e0  52               push dx                                  
  07e1  57               push di                                  
  07e2  ff7610           push word ptr [bp + 0x10]                
  07e5  ff76fa           push word ptr [bp - 6]                   
  07e8  ff76f8           push word ptr [bp - 8]                   
  07eb  ff76fe           push word ptr [bp - 2]                   
  07ee  ff76fc           push word ptr [bp - 4]                   
  07f1  ff1ebc69         lcall [0x69bc]                           
  07f5  83c410           add sp, 0x10                             
  07f8  eb37             jmp 0x831                                
  07fa  837ef200         cmp word ptr [bp - 0xe], 0               
  07fe  7418             je 0x818                                 
  0800  53               push bx                                  
  0801  52               push dx                                  
  0802  57               push di                                  
  0803  ff7610           push word ptr [bp + 0x10]                
  0806  ff76fa           push word ptr [bp - 6]                   
  0809  ff76f8           push word ptr [bp - 8]                   
  080c  ff76fe           push word ptr [bp - 2]                   
  080f  ff76fc           push word ptr [bp - 4]                   
  0812  ff1ec069         lcall [0x69c0]                           
  0816  eb16             jmp 0x82e                                
  0818  53               push bx                                  
  0819  52               push dx                                  
  081a  57               push di                                  
  081b  ff7610           push word ptr [bp + 0x10]                
  081e  ff76fa           push word ptr [bp - 6]                   
  0821  ff76f8           push word ptr [bp - 8]                   
  0824  ff76fe           push word ptr [bp - 2]                   
  0827  ff76fc           push word ptr [bp - 4]                   
  082a  ff1ec469         lcall [0x69c4]                           
  082e  83c410           add sp, 0x10                             
  0831  8b46f6           mov ax, word ptr [bp - 0xa]              
  0834  c1e002           shl ax, 2                                
  0837  c45e06           les bx, ptr [bp + 6]                     
  083a  03d8             add bx, ax                               
  083c  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0840  260b470c         or ax, word ptr es:[bx + 0xc]            
  0844  7426             je 0x86c                                 
  0846  c45e06           les bx, ptr [bp + 6]                     
  0849  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  084f  751b             jne 0x86c                                
  0851  8b46f6           mov ax, word ptr [bp - 0xa]              
  0854  c1e002           shl ax, 2                                
  0857  c45e06           les bx, ptr [bp + 6]                     
  085a  03d8             add bx, ax                               
  085c  26ff770c         push word ptr es:[bx + 0xc]              
  0860  26ff770a         push word ptr es:[bx + 0xa]              
  0864  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0869  83c404           add sp, 4                                
  086c  ff46f6           inc word ptr [bp - 0xa]                  
  086f  c45e06           les bx, ptr [bp + 6]                     
  0872  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0876  b400             mov ah, 0                                
  0878  3b46f6           cmp ax, word ptr [bp - 0xa]              
  087b  7e03             jle 0x880                                
  087d  e9befd           jmp 0x63e                                
  0880  5f               pop di                                   
  0881  5e               pop si                                   
  0882  c9               leave                                    
  0883  cb               retf                                     

res_0f00_0884:  ; ENTRY
  0884  c8180000         enter 0x18, 0                            
  0888  56               push si                                  
  0889  57               push di                                  
  088a  c45e06           les bx, ptr [bp + 6]                     
  088d  268b4704         mov ax, word ptr es:[bx + 4]             
  0891  c41ee734         les bx, ptr [0x34e7]                     
  0895  263b4704         cmp ax, word ptr es:[bx + 4]             
  0899  7216             jb 0x8b1                                 
  089b  c45e06           les bx, ptr [bp + 6]                     
  089e  268b4706         mov ax, word ptr es:[bx + 6]             
  08a2  c41ee734         les bx, ptr [0x34e7]                     
  08a6  263b4706         cmp ax, word ptr es:[bx + 6]             
  08aa  7205             jb 0x8b1                                 
  08ac  b80100           mov ax, 1                                
  08af  eb02             jmp 0x8b3                                
  08b1  33c0             xor ax, ax                               
  08b3  8946e8           mov word ptr [bp - 0x18], ax             
  08b6  837ee800         cmp word ptr [bp - 0x18], 0              
  08ba  7554             jne 0x910                                
  08bc  c45e06           les bx, ptr [bp + 6]                     
  08bf  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  08c5  7449             je 0x910                                 
  08c7  c45e06           les bx, ptr [bp + 6]                     
  08ca  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  08d0  753e             jne 0x910                                
  08d2  33ff             xor di, di                               
  08d4  eb2d             jmp 0x903                                
  08d6  8bc7             mov ax, di                               
  08d8  c1e002           shl ax, 2                                
  08db  c45e06           les bx, ptr [bp + 6]                     
  08de  03d8             add bx, ax                               
  08e0  26ff770c         push word ptr es:[bx + 0xc]              
  08e4  26ff770a         push word ptr es:[bx + 0xa]              
  08e8  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  08ed  83c404           add sp, 4                                
  08f0  8bdf             mov bx, di                               
  08f2  c1e302           shl bx, 2                                
  08f5  c47606           les si, ptr [bp + 6]                     
  08f8  03f3             add si, bx                               
  08fa  2689541c         mov word ptr es:[si + 0x1c], dx          
  08fe  2689441a         mov word ptr es:[si + 0x1a], ax          
  0902  47               inc di                                   
  0903  c45e06           les bx, ptr [bp + 6]                     
  0906  268a4734         mov al, byte ptr es:[bx + 0x34]          
  090a  b400             mov ah, 0                                
  090c  3bc7             cmp ax, di                               
  090e  7fc6             jg 0x8d6                                 
  0910  8b4616           mov ax, word ptr [bp + 0x16]             
  0913  2306a469         and ax, word ptr [0x69a4]                
  0917  8946f2           mov word ptr [bp - 0xe], ax              
  091a  8b460e           mov ax, word ptr [bp + 0xe]              
  091d  2306a469         and ax, word ptr [0x69a4]                
  0921  8946ee           mov word ptr [bp - 0x12], ax             
  0924  8a0e9e69         mov cl, byte ptr [0x699e]                
  0928  d37e0e           sar word ptr [bp + 0xe], cl              
  092b  33ff             xor di, di                               
  092d  e90903           jmp 0xc39                                
  0930  837ee800         cmp word ptr [bp - 0x18], 0              
  0934  744b             je 0x981                                 
  0936  8bc7             mov ax, di                               
  0938  c1e002           shl ax, 2                                
  093b  c45e06           les bx, ptr [bp + 6]                     
  093e  03d8             add bx, ax                               
  0940  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0944  260b470c         or ax, word ptr es:[bx + 0xc]            
  0948  7437             je 0x981                                 
  094a  c45e06           les bx, ptr [bp + 6]                     
  094d  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0953  752c             jne 0x981                                
  0955  8bc7             mov ax, di                               
  0957  c1e002           shl ax, 2                                
  095a  c45e06           les bx, ptr [bp + 6]                     
  095d  03d8             add bx, ax                               
  095f  26ff770c         push word ptr es:[bx + 0xc]              
  0963  26ff770a         push word ptr es:[bx + 0xa]              
  0967  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  096c  83c404           add sp, 4                                
  096f  8bdf             mov bx, di                               
  0971  c1e302           shl bx, 2                                
  0974  c47606           les si, ptr [bp + 6]                     
  0977  03f3             add si, bx                               
  0979  2689541c         mov word ptr es:[si + 0x1c], dx          
  097d  2689441a         mov word ptr es:[si + 0x1a], ax          
  0981  57               push di                                  
  0982  9a1800680e       lcall 0xe68, 0x18                        -> 0e68:0018
  0987  59               pop cx                                   
  0988  c45e06           les bx, ptr [bp + 6]                     
  098b  26f747350100     test word ptr es:[bx + 0x35], 1          
  0991  744e             je 0x9e1                                 
  0993  c45e06           les bx, ptr [bp + 6]                     
  0996  268b4706         mov ax, word ptr es:[bx + 6]             
  099a  3b460c           cmp ax, word ptr [bp + 0xc]              
  099d  7f42             jg 0x9e1                                 
  099f  c45e06           les bx, ptr [bp + 6]                     
  09a2  26c45f37         les bx, ptr es:[bx + 0x37]               
  09a6  8bc7             mov ax, di                               
  09a8  c1e002           shl ax, 2                                
  09ab  03d8             add bx, ax                               
  09ad  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  09b1  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  09b5  c45e06           les bx, ptr [bp + 6]                     
  09b8  52               push dx                                  
  09b9  50               push ax                                  
  09ba  8b460c           mov ax, word ptr [bp + 0xc]              
  09bd  262b4706         sub ax, word ptr es:[bx + 6]             
  09c1  c45e06           les bx, ptr [bp + 6]                     
  09c4  26c45f37         les bx, ptr es:[bx + 0x37]               
  09c8  26f76f08         imul word ptr es:[bx + 8]                
  09cc  d1e0             shl ax, 1                                
  09ce  8bd0             mov dx, ax                               
  09d0  58               pop ax                                   
  09d1  03c2             add ax, dx                               
  09d3  8b560a           mov dx, word ptr [bp + 0xa]              
  09d6  8a0e9e69         mov cl, byte ptr [0x699e]                
  09da  d3fa             sar dx, cl                               
  09dc  03c2             add ax, dx                               
  09de  5a               pop dx                                   
  09df  eb31             jmp 0xa12                                
  09e1  8bc7             mov ax, di                               
  09e3  c1e002           shl ax, 2                                
  09e6  c45e06           les bx, ptr [bp + 6]                     
  09e9  03d8             add bx, ax                               
  09eb  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  09ef  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  09f3  c45e06           les bx, ptr [bp + 6]                     
  09f6  52               push dx                                  
  09f7  50               push ax                                  
  09f8  8b460c           mov ax, word ptr [bp + 0xc]              
  09fb  26f76f08         imul word ptr es:[bx + 8]                
  09ff  d1e0             shl ax, 1                                
  0a01  8bd0             mov dx, ax                               
  0a03  58               pop ax                                   
  0a04  03c2             add ax, dx                               
  0a06  8b560a           mov dx, word ptr [bp + 0xa]              
  0a09  8a0e9e69         mov cl, byte ptr [0x699e]                
  0a0d  d3fa             sar dx, cl                               
  0a0f  03c2             add ax, dx                               
  0a11  5a               pop dx                                   
  0a12  8956fa           mov word ptr [bp - 6], dx                
  0a15  8946f8           mov word ptr [bp - 8], ax                
  0a18  c45e12           les bx, ptr [bp + 0x12]                  
  0a1b  26f747350100     test word ptr es:[bx + 0x35], 1          
  0a21  744e             je 0xa71                                 
  0a23  c45e12           les bx, ptr [bp + 0x12]                  
  0a26  268b4706         mov ax, word ptr es:[bx + 6]             
  0a2a  3b4618           cmp ax, word ptr [bp + 0x18]             
  0a2d  7f42             jg 0xa71                                 
  0a2f  c45e12           les bx, ptr [bp + 0x12]                  
  0a32  26c45f37         les bx, ptr es:[bx + 0x37]               
  0a36  8bc7             mov ax, di                               
  0a38  c1e002           shl ax, 2                                
  0a3b  03d8             add bx, ax                               
  0a3d  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  0a41  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  0a45  c45e12           les bx, ptr [bp + 0x12]                  
  0a48  52               push dx                                  
  0a49  50               push ax                                  
  0a4a  8b4618           mov ax, word ptr [bp + 0x18]             
  0a4d  262b4706         sub ax, word ptr es:[bx + 6]             
  0a51  c45e12           les bx, ptr [bp + 0x12]                  
  0a54  26c45f37         les bx, ptr es:[bx + 0x37]               
  0a58  26f76f08         imul word ptr es:[bx + 8]                
  0a5c  d1e0             shl ax, 1                                
  0a5e  8bd0             mov dx, ax                               
  0a60  58               pop ax                                   
  0a61  03c2             add ax, dx                               
  0a63  8b5616           mov dx, word ptr [bp + 0x16]             
  0a66  8a0e9e69         mov cl, byte ptr [0x699e]                
  0a6a  d3fa             sar dx, cl                               
  0a6c  03c2             add ax, dx                               
  0a6e  5a               pop dx                                   
  0a6f  eb31             jmp 0xaa2                                
  0a71  8bc7             mov ax, di                               
  0a73  c1e002           shl ax, 2                                
  0a76  c45e12           les bx, ptr [bp + 0x12]                  
  0a79  03d8             add bx, ax                               
  0a7b  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  0a7f  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  0a83  c45e12           les bx, ptr [bp + 0x12]                  
  0a86  52               push dx                                  
  0a87  50               push ax                                  
  0a88  8b4618           mov ax, word ptr [bp + 0x18]             
  0a8b  26f76f08         imul word ptr es:[bx + 8]                
  0a8f  d1e0             shl ax, 1                                
  0a91  8bd0             mov dx, ax                               
  0a93  58               pop ax                                   
  0a94  03c2             add ax, dx                               
  0a96  8b5616           mov dx, word ptr [bp + 0x16]             
  0a99  8a0e9e69         mov cl, byte ptr [0x699e]                
  0a9d  d3fa             sar dx, cl                               
  0a9f  03c2             add ax, dx                               
  0aa1  5a               pop dx                                   
  0aa2  8956f6           mov word ptr [bp - 0xa], dx              
  0aa5  8946f4           mov word ptr [bp - 0xc], ax              
  0aa8  c45e06           les bx, ptr [bp + 6]                     
  0aab  268b4708         mov ax, word ptr es:[bx + 8]             
  0aaf  d1e0             shl ax, 1                                
  0ab1  2b460e           sub ax, word ptr [bp + 0xe]              
  0ab4  8946ec           mov word ptr [bp - 0x14], ax             
  0ab7  c45e12           les bx, ptr [bp + 0x12]                  
  0aba  268b4708         mov ax, word ptr es:[bx + 8]             
  0abe  d1e0             shl ax, 1                                
  0ac0  2b460e           sub ax, word ptr [bp + 0xe]              
  0ac3  8946ea           mov word ptr [bp - 0x16], ax             
  0ac6  8b4610           mov ax, word ptr [bp + 0x10]             
  0ac9  8946f0           mov word ptr [bp - 0x10], ax             
  0acc  e92301           jmp 0xbf2                                
  0acf  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0ad2  c476f4           les si, ptr [bp - 0xc]                   
  0ad5  268a04           mov al, byte ptr es:[si]                 
  0ad8  22870234         and al, byte ptr [bx + 0x3402]           
  0adc  8846ff           mov byte ptr [bp - 1], al                
  0adf  8b560e           mov dx, word ptr [bp + 0xe]              
  0ae2  eb41             jmp 0xb25                                
  0ae4  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0ae7  c476f8           les si, ptr [bp - 8]                     
  0aea  268a04           mov al, byte ptr es:[si]                 
  0aed  2287fa33         and al, byte ptr [bx + 0x33fa]           
  0af1  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0af4  8a8f1234         mov cl, byte ptr [bx + 0x3412]           
  0af8  d2e0             shl al, cl                               
  0afa  8846fe           mov byte ptr [bp - 2], al                
  0afd  c45ef8           les bx, ptr [bp - 8]                     
  0b00  268a07           mov al, byte ptr es:[bx]                 
  0b03  98               cwde                                     
  0b04  8a4ef2           mov cl, byte ptr [bp - 0xe]              
  0b07  d3f8             sar ax, cl                               
  0b09  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0b0c  22870a34         and al, byte ptr [bx + 0x340a]           
  0b10  0a46ff           or al, byte ptr [bp - 1]                 
  0b13  c45ef4           les bx, ptr [bp - 0xc]                   
  0b16  268807           mov byte ptr es:[bx], al                 
  0b19  ff46f8           inc word ptr [bp - 8]                    
  0b1c  ff46f4           inc word ptr [bp - 0xc]                  
  0b1f  8a46fe           mov al, byte ptr [bp - 2]                
  0b22  8846ff           mov byte ptr [bp - 1], al                
  0b25  8bc2             mov ax, dx                               
  0b27  4a               dec dx                                   
  0b28  0bc0             or ax, ax                                
  0b2a  75b8             jne 0xae4                                
  0b2c  8a46ee           mov al, byte ptr [bp - 0x12]             
  0b2f  0246f2           add al, byte ptr [bp - 0xe]              
  0b32  8846fd           mov byte ptr [bp - 3], al                
  0b35  b400             mov ah, 0                                
  0b37  3b06a469         cmp ax, word ptr [0x69a4]                
  0b3b  7e6c             jle 0xba9                                
  0b3d  8a46fd           mov al, byte ptr [bp - 3]                
  0b40  b400             mov ah, 0                                
  0b42  2b06a869         sub ax, word ptr [0x69a8]                
  0b46  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0b49  c476f8           les si, ptr [bp - 8]                     
  0b4c  268a14           mov dl, byte ptr es:[si]                 
  0b4f  2297fa33         and dl, byte ptr [bx + 0x33fa]           
  0b53  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0b56  8a8f1234         mov cl, byte ptr [bx + 0x3412]           
  0b5a  d2e2             shl dl, cl                               
  0b5c  8bd8             mov bx, ax                               
  0b5e  22970234         and dl, byte ptr [bx + 0x3402]           
  0b62  8856fe           mov byte ptr [bp - 2], dl                
  0b65  c45ef8           les bx, ptr [bp - 8]                     
  0b68  268a07           mov al, byte ptr es:[bx]                 
  0b6b  98               cwde                                     
  0b6c  8a4ef2           mov cl, byte ptr [bp - 0xe]              
  0b6f  d3f8             sar ax, cl                               
  0b71  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0b74  22870a34         and al, byte ptr [bx + 0x340a]           
  0b78  0a46ff           or al, byte ptr [bp - 1]                 
  0b7b  c45ef4           les bx, ptr [bp - 0xc]                   
  0b7e  268807           mov byte ptr es:[bx], al                 
  0b81  8a46fe           mov al, byte ptr [bp - 2]                
  0b84  8846ff           mov byte ptr [bp - 1], al                
  0b87  8a46fd           mov al, byte ptr [bp - 3]                
  0b8a  b400             mov ah, 0                                
  0b8c  2b06a869         sub ax, word ptr [0x69a8]                
  0b90  c45ef4           les bx, ptr [bp - 0xc]                   
  0b93  268a5701         mov dl, byte ptr es:[bx + 1]             
  0b97  8bd8             mov bx, ax                               
  0b99  22970a34         and dl, byte ptr [bx + 0x340a]           
  0b9d  0a56ff           or dl, byte ptr [bp - 1]                 
  0ba0  c45ef4           les bx, ptr [bp - 0xc]                   
  0ba3  26885701         mov byte ptr es:[bx + 1], dl             
  0ba7  eb3d             jmp 0xbe6                                
  0ba9  807efd00         cmp byte ptr [bp - 3], 0                 
  0bad  7437             je 0xbe6                                 
  0baf  837eee00         cmp word ptr [bp - 0x12], 0              
  0bb3  7417             je 0xbcc                                 
  0bb5  8b5eee           mov bx, word ptr [bp - 0x12]             
  0bb8  c476f8           les si, ptr [bp - 8]                     
  0bbb  268a04           mov al, byte ptr es:[si]                 
  0bbe  22870234         and al, byte ptr [bx + 0x3402]           
  0bc2  b400             mov ah, 0                                
  0bc4  8a4ef2           mov cl, byte ptr [bp - 0xe]              
  0bc7  d3f8             sar ax, cl                               
  0bc9  0846ff           or byte ptr [bp - 1], al                 
  0bcc  8a46fd           mov al, byte ptr [bp - 3]                
  0bcf  b400             mov ah, 0                                
  0bd1  c45ef4           les bx, ptr [bp - 0xc]                   
  0bd4  268a17           mov dl, byte ptr es:[bx]                 
  0bd7  8bd8             mov bx, ax                               
  0bd9  22970a34         and dl, byte ptr [bx + 0x340a]           
  0bdd  0a56ff           or dl, byte ptr [bp - 1]                 
  0be0  c45ef4           les bx, ptr [bp - 0xc]                   
  0be3  268817           mov byte ptr es:[bx], dl                 
  0be6  8b46ea           mov ax, word ptr [bp - 0x16]             
  0be9  0146f4           add word ptr [bp - 0xc], ax              
  0bec  8b46ec           mov ax, word ptr [bp - 0x14]             
  0bef  0146f8           add word ptr [bp - 8], ax                
  0bf2  8b46f0           mov ax, word ptr [bp - 0x10]             
  0bf5  ff4ef0           dec word ptr [bp - 0x10]                 
  0bf8  0bc0             or ax, ax                                
  0bfa  7403             je 0xbff                                 
  0bfc  e9d0fe           jmp 0xacf                                
  0bff  8bc7             mov ax, di                               
  0c01  c1e002           shl ax, 2                                
  0c04  c45e06           les bx, ptr [bp + 6]                     
  0c07  03d8             add bx, ax                               
  0c09  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0c0d  260b470c         or ax, word ptr es:[bx + 0xc]            
  0c11  7425             je 0xc38                                 
  0c13  c45e06           les bx, ptr [bp + 6]                     
  0c16  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0c1c  751a             jne 0xc38                                
  0c1e  8bc7             mov ax, di                               
  0c20  c1e002           shl ax, 2                                
  0c23  c45e06           les bx, ptr [bp + 6]                     
  0c26  03d8             add bx, ax                               
  0c28  26ff770c         push word ptr es:[bx + 0xc]              
  0c2c  26ff770a         push word ptr es:[bx + 0xa]              
  0c30  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0c35  83c404           add sp, 4                                
  0c38  47               inc di                                   
  0c39  c45e06           les bx, ptr [bp + 6]                     
  0c3c  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0c40  b400             mov ah, 0                                
  0c42  3bc7             cmp ax, di                               
  0c44  7e03             jle 0xc49                                
  0c46  e9e7fc           jmp 0x930                                
  0c49  5f               pop di                                   
  0c4a  5e               pop si                                   
  0c4b  c9               leave                                    
  0c4c  cb               retf                                     
  0c4d  c8080000         enter 8, 0                               
  0c51  56               push si                                  
  0c52  57               push di                                  
  0c53  c45e06           les bx, ptr [bp + 6]                     
  0c56  8b460c           mov ax, word ptr [bp + 0xc]              
  0c59  26f76f08         imul word ptr es:[bx + 8]                
  0c5d  d1e0             shl ax, 1                                
  0c5f  8b560a           mov dx, word ptr [bp + 0xa]              
  0c62  8a0e9e69         mov cl, byte ptr [0x699e]                
  0c66  d3fa             sar dx, cl                               
  0c68  03c2             add ax, dx                               
  0c6a  8946fe           mov word ptr [bp - 2], ax                
  0c6d  c45e12           les bx, ptr [bp + 0x12]                  
  0c70  8b4618           mov ax, word ptr [bp + 0x18]             
  0c73  26f76f08         imul word ptr es:[bx + 8]                
  0c77  d1e0             shl ax, 1                                
  0c79  8b5616           mov dx, word ptr [bp + 0x16]             
  0c7c  8a0e9e69         mov cl, byte ptr [0x699e]                
  0c80  d3fa             sar dx, cl                               
  0c82  03c2             add ax, dx                               
  0c84  8946fc           mov word ptr [bp - 4], ax                
  0c87  c45e1a           les bx, ptr [bp + 0x1a]                  
  0c8a  8b4620           mov ax, word ptr [bp + 0x20]             
  0c8d  26f76f08         imul word ptr es:[bx + 8]                
  0c91  d1e0             shl ax, 1                                
  0c93  8b561e           mov dx, word ptr [bp + 0x1e]             
  0c96  8a0e9e69         mov cl, byte ptr [0x699e]                
  0c9a  d3fa             sar dx, cl                               
  0c9c  03c2             add ax, dx                               
  0c9e  8946fa           mov word ptr [bp - 6], ax                
  0ca1  c45e06           les bx, ptr [bp + 6]                     
  0ca4  268b4704         mov ax, word ptr es:[bx + 4]             
  0ca8  c41ee734         les bx, ptr [0x34e7]                     
  0cac  263b4704         cmp ax, word ptr es:[bx + 4]             
  0cb0  7216             jb 0xcc8                                 
  0cb2  c45e06           les bx, ptr [bp + 6]                     
  0cb5  268b4706         mov ax, word ptr es:[bx + 6]             
  0cb9  c41ee734         les bx, ptr [0x34e7]                     
  0cbd  263b4706         cmp ax, word ptr es:[bx + 6]             
  0cc1  7205             jb 0xcc8                                 
  0cc3  b80100           mov ax, 1                                
  0cc6  eb02             jmp 0xcca                                
  0cc8  33c0             xor ax, ax                               
  0cca  8946f8           mov word ptr [bp - 8], ax                
  0ccd  837ef800         cmp word ptr [bp - 8], 0                 
  0cd1  7554             jne 0xd27                                
  0cd3  c45e06           les bx, ptr [bp + 6]                     
  0cd6  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  0cdc  7449             je 0xd27                                 
  0cde  c45e06           les bx, ptr [bp + 6]                     
  0ce1  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0ce7  753e             jne 0xd27                                
  0ce9  33ff             xor di, di                               
  0ceb  eb2d             jmp 0xd1a                                
  0ced  8bc7             mov ax, di                               
  0cef  c1e002           shl ax, 2                                
  0cf2  c45e06           les bx, ptr [bp + 6]                     
  0cf5  03d8             add bx, ax                               
  0cf7  26ff770c         push word ptr es:[bx + 0xc]              
  0cfb  26ff770a         push word ptr es:[bx + 0xa]              
  0cff  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0d04  83c404           add sp, 4                                
  0d07  8bdf             mov bx, di                               
  0d09  c1e302           shl bx, 2                                
  0d0c  c47606           les si, ptr [bp + 6]                     
  0d0f  03f3             add si, bx                               
  0d11  2689541c         mov word ptr es:[si + 0x1c], dx          
  0d15  2689441a         mov word ptr es:[si + 0x1a], ax          
  0d19  47               inc di                                   
  0d1a  c45e06           les bx, ptr [bp + 6]                     
  0d1d  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0d21  b400             mov ah, 0                                
  0d23  3bc7             cmp ax, di                               
  0d25  7fc6             jg 0xced                                 
  0d27  8cd8             mov ax, ds                               
  0d29  394614           cmp word ptr [bp + 0x14], ax             
  0d2c  7403             je 0xd31                                 
  0d2e  e9b501           jmp 0xee6                                
  0d31  817e122a34       cmp word ptr [bp + 0x12], 0x342a         
  0d36  7403             je 0xd3b                                 
  0d38  e9ab01           jmp 0xee6                                
  0d3b  c45e1a           les bx, ptr [bp + 0x1a]                  
  0d3e  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  0d44  7449             je 0xd8f                                 
  0d46  c45e1a           les bx, ptr [bp + 0x1a]                  
  0d49  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0d4f  753e             jne 0xd8f                                
  0d51  33ff             xor di, di                               
  0d53  eb2d             jmp 0xd82                                
  0d55  8bc7             mov ax, di                               
  0d57  c1e002           shl ax, 2                                
  0d5a  c45e1a           les bx, ptr [bp + 0x1a]                  
  0d5d  03d8             add bx, ax                               
  0d5f  26ff770c         push word ptr es:[bx + 0xc]              
  0d63  26ff770a         push word ptr es:[bx + 0xa]              
  0d67  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0d6c  83c404           add sp, 4                                
  0d6f  8bdf             mov bx, di                               
  0d71  c1e302           shl bx, 2                                
  0d74  c4761a           les si, ptr [bp + 0x1a]                  
  0d77  03f3             add si, bx                               
  0d79  2689541c         mov word ptr es:[si + 0x1c], dx          
  0d7d  2689441a         mov word ptr es:[si + 0x1a], ax          
  0d81  47               inc di                                   
  0d82  c45e1a           les bx, ptr [bp + 0x1a]                  
  0d85  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0d89  b400             mov ah, 0                                
  0d8b  3bc7             cmp ax, di                               
  0d8d  7fc6             jg 0xd55                                 
  0d8f  33ff             xor di, di                               
  0d91  e9fd00           jmp 0xe91                                
  0d94  837ef800         cmp word ptr [bp - 8], 0                 
  0d98  744b             je 0xde5                                 
  0d9a  8bc7             mov ax, di                               
  0d9c  c1e002           shl ax, 2                                
  0d9f  c45e06           les bx, ptr [bp + 6]                     
  0da2  03d8             add bx, ax                               
  0da4  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0da8  260b470c         or ax, word ptr es:[bx + 0xc]            
  0dac  7437             je 0xde5                                 
  0dae  c45e06           les bx, ptr [bp + 6]                     
  0db1  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0db7  752c             jne 0xde5                                
  0db9  8bc7             mov ax, di                               
  0dbb  c1e002           shl ax, 2                                
  0dbe  c45e06           les bx, ptr [bp + 6]                     
  0dc1  03d8             add bx, ax                               
  0dc3  26ff770c         push word ptr es:[bx + 0xc]              
  0dc7  26ff770a         push word ptr es:[bx + 0xa]              
  0dcb  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0dd0  83c404           add sp, 4                                
  0dd3  8bdf             mov bx, di                               
  0dd5  c1e302           shl bx, 2                                
  0dd8  c47606           les si, ptr [bp + 6]                     
  0ddb  03f3             add si, bx                               
  0ddd  2689541c         mov word ptr es:[si + 0x1c], dx          
  0de1  2689441a         mov word ptr es:[si + 0x1a], ax          
  0de5  57               push di                                  
  0de6  9a1800680e       lcall 0xe68, 0x18                        -> 0e68:0018
  0deb  59               pop cx                                   
  0dec  c45e1a           les bx, ptr [bp + 0x1a]                  
  0def  26ff7708         push word ptr es:[bx + 8]                
  0df3  ff76fa           push word ptr [bp - 6]                   
  0df6  c45e1a           les bx, ptr [bp + 0x1a]                  
  0df9  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  0dfe  66c1e810         shr eax, 0x10                            
  0e02  50               push ax                                  
  0e03  ff7610           push word ptr [bp + 0x10]                
  0e06  8b460e           mov ax, word ptr [bp + 0xe]              
  0e09  8a0ea069         mov cl, byte ptr [0x69a0]                
  0e0d  d3f8             sar ax, cl                               
  0e0f  50               push ax                                  
  0e10  ff7618           push word ptr [bp + 0x18]                
  0e13  8b4616           mov ax, word ptr [bp + 0x16]             
  0e16  8a0e9e69         mov cl, byte ptr [0x699e]                
  0e1a  d3f8             sar ax, cl                               
  0e1c  50               push ax                                  
  0e1d  8bc7             mov ax, di                               
  0e1f  c1e002           shl ax, 2                                
  0e22  c45e12           les bx, ptr [bp + 0x12]                  
  0e25  03d8             add bx, ax                               
  0e27  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  0e2c  66c1e810         shr eax, 0x10                            
  0e30  50               push ax                                  
  0e31  c45e06           les bx, ptr [bp + 6]                     
  0e34  26ff7708         push word ptr es:[bx + 8]                
  0e38  ff76fe           push word ptr [bp - 2]                   
  0e3b  8bc7             mov ax, di                               
  0e3d  c1e002           shl ax, 2                                
  0e40  c45e06           les bx, ptr [bp + 6]                     
  0e43  03d8             add bx, ax                               
  0e45  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  0e4a  66c1e810         shr eax, 0x10                            
  0e4e  50               push ax                                  
  0e4f  9a5900680e       lcall 0xe68, 0x59                        -> 0e68:0059
  0e54  83c416           add sp, 0x16                             
  0e57  8bc7             mov ax, di                               
  0e59  c1e002           shl ax, 2                                
  0e5c  c45e06           les bx, ptr [bp + 6]                     
  0e5f  03d8             add bx, ax                               
  0e61  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0e65  260b470c         or ax, word ptr es:[bx + 0xc]            
  0e69  7425             je 0xe90                                 
  0e6b  c45e06           les bx, ptr [bp + 6]                     
  0e6e  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0e74  751a             jne 0xe90                                
  0e76  8bc7             mov ax, di                               
  0e78  c1e002           shl ax, 2                                
  0e7b  c45e06           les bx, ptr [bp + 6]                     
  0e7e  03d8             add bx, ax                               
  0e80  26ff770c         push word ptr es:[bx + 0xc]              
  0e84  26ff770a         push word ptr es:[bx + 0xa]              
  0e88  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0e8d  83c404           add sp, 4                                
  0e90  47               inc di                                   
  0e91  c45e06           les bx, ptr [bp + 6]                     
  0e94  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0e98  b400             mov ah, 0                                
  0e9a  3bc7             cmp ax, di                               
  0e9c  7e03             jle 0xea1                                
  0e9e  e9f3fe           jmp 0xd94                                
  0ea1  c45e1a           les bx, ptr [bp + 0x1a]                  
  0ea4  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  0eaa  7437             je 0xee3                                 
  0eac  c45e1a           les bx, ptr [bp + 0x1a]                  
  0eaf  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0eb5  752c             jne 0xee3                                
  0eb7  33f6             xor si, si                               
  0eb9  eb1b             jmp 0xed6                                
  0ebb  8bc6             mov ax, si                               
  0ebd  c1e002           shl ax, 2                                
  0ec0  c45e1a           les bx, ptr [bp + 0x1a]                  
  0ec3  03d8             add bx, ax                               
  0ec5  26ff770c         push word ptr es:[bx + 0xc]              
  0ec9  26ff770a         push word ptr es:[bx + 0xa]              
  0ecd  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0ed2  83c404           add sp, 4                                
  0ed5  46               inc si                                   
  0ed6  c45e1a           les bx, ptr [bp + 0x1a]                  
  0ed9  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0edd  b400             mov ah, 0                                
  0edf  3bc6             cmp ax, si                               
  0ee1  7fd8             jg 0xebb                                 
  0ee3  e93b02           jmp 0x1121                               
  0ee6  c45e1a           les bx, ptr [bp + 0x1a]                  
  0ee9  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  0eef  7449             je 0xf3a                                 
  0ef1  c45e1a           les bx, ptr [bp + 0x1a]                  
  0ef4  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0efa  753e             jne 0xf3a                                
  0efc  33ff             xor di, di                               
  0efe  eb2d             jmp 0xf2d                                
  0f00  8bc7             mov ax, di                               
  0f02  c1e002           shl ax, 2                                
  0f05  c45e1a           les bx, ptr [bp + 0x1a]                  
  0f08  03d8             add bx, ax                               
  0f0a  26ff770c         push word ptr es:[bx + 0xc]              
  0f0e  26ff770a         push word ptr es:[bx + 0xa]              
  0f12  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0f17  83c404           add sp, 4                                
  0f1a  8bdf             mov bx, di                               
  0f1c  c1e302           shl bx, 2                                
  0f1f  c4761a           les si, ptr [bp + 0x1a]                  
  0f22  03f3             add si, bx                               
  0f24  2689541c         mov word ptr es:[si + 0x1c], dx          
  0f28  2689441a         mov word ptr es:[si + 0x1a], ax          
  0f2c  47               inc di                                   
  0f2d  c45e1a           les bx, ptr [bp + 0x1a]                  
  0f30  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0f34  b400             mov ah, 0                                
  0f36  3bc7             cmp ax, di                               
  0f38  7fc6             jg 0xf00                                 
  0f3a  c45e12           les bx, ptr [bp + 0x12]                  
  0f3d  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  0f43  7449             je 0xf8e                                 
  0f45  c45e12           les bx, ptr [bp + 0x12]                  
  0f48  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0f4e  753e             jne 0xf8e                                
  0f50  33ff             xor di, di                               
  0f52  eb2d             jmp 0xf81                                
  0f54  8bc7             mov ax, di                               
  0f56  c1e002           shl ax, 2                                
  0f59  c45e12           les bx, ptr [bp + 0x12]                  
  0f5c  03d8             add bx, ax                               
  0f5e  26ff770c         push word ptr es:[bx + 0xc]              
  0f62  26ff770a         push word ptr es:[bx + 0xa]              
  0f66  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0f6b  83c404           add sp, 4                                
  0f6e  8bdf             mov bx, di                               
  0f70  c1e302           shl bx, 2                                
  0f73  c47612           les si, ptr [bp + 0x12]                  
  0f76  03f3             add si, bx                               
  0f78  2689541c         mov word ptr es:[si + 0x1c], dx          
  0f7c  2689441a         mov word ptr es:[si + 0x1a], ax          
  0f80  47               inc di                                   
  0f81  c45e12           les bx, ptr [bp + 0x12]                  
  0f84  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0f88  b400             mov ah, 0                                
  0f8a  3bc7             cmp ax, di                               
  0f8c  7fc6             jg 0xf54                                 
  0f8e  33ff             xor di, di                               
  0f90  e9fa00           jmp 0x108d                               
  0f93  837ef800         cmp word ptr [bp - 8], 0                 
  0f97  744b             je 0xfe4                                 
  0f99  8bc7             mov ax, di                               
  0f9b  c1e002           shl ax, 2                                
  0f9e  c45e06           les bx, ptr [bp + 6]                     
  0fa1  03d8             add bx, ax                               
  0fa3  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0fa7  260b470c         or ax, word ptr es:[bx + 0xc]            
  0fab  7437             je 0xfe4                                 
  0fad  c45e06           les bx, ptr [bp + 6]                     
  0fb0  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0fb6  752c             jne 0xfe4                                
  0fb8  8bc7             mov ax, di                               
  0fba  c1e002           shl ax, 2                                
  0fbd  c45e06           les bx, ptr [bp + 6]                     
  0fc0  03d8             add bx, ax                               
  0fc2  26ff770c         push word ptr es:[bx + 0xc]              
  0fc6  26ff770a         push word ptr es:[bx + 0xa]              
  0fca  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0fcf  83c404           add sp, 4                                
  0fd2  8bdf             mov bx, di                               
  0fd4  c1e302           shl bx, 2                                
  0fd7  c47606           les si, ptr [bp + 6]                     
  0fda  03f3             add si, bx                               
  0fdc  2689541c         mov word ptr es:[si + 0x1c], dx          
  0fe0  2689441a         mov word ptr es:[si + 0x1a], ax          
  0fe4  57               push di                                  
  0fe5  9a1800680e       lcall 0xe68, 0x18                        -> 0e68:0018
  0fea  59               pop cx                                   
  0feb  c45e1a           les bx, ptr [bp + 0x1a]                  
  0fee  26ff7708         push word ptr es:[bx + 8]                
  0ff2  ff76fa           push word ptr [bp - 6]                   
  0ff5  c45e1a           les bx, ptr [bp + 0x1a]                  
  0ff8  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  0ffd  66c1e810         shr eax, 0x10                            
  1001  50               push ax                                  
  1002  ff7610           push word ptr [bp + 0x10]                
  1005  8b460e           mov ax, word ptr [bp + 0xe]              
  1008  8a0ea069         mov cl, byte ptr [0x69a0]                
  100c  d3f8             sar ax, cl                               
  100e  50               push ax                                  
  100f  c45e12           les bx, ptr [bp + 0x12]                  
  1012  26ff7708         push word ptr es:[bx + 8]                
  1016  ff76fc           push word ptr [bp - 4]                   
  1019  8bc7             mov ax, di                               
  101b  c1e002           shl ax, 2                                
  101e  c45e12           les bx, ptr [bp + 0x12]                  
  1021  03d8             add bx, ax                               
  1023  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  1028  66c1e810         shr eax, 0x10                            
  102c  50               push ax                                  
  102d  c45e06           les bx, ptr [bp + 6]                     
  1030  26ff7708         push word ptr es:[bx + 8]                
  1034  ff76fe           push word ptr [bp - 2]                   
  1037  8bc7             mov ax, di                               
  1039  c1e002           shl ax, 2                                
  103c  c45e06           les bx, ptr [bp + 6]                     
  103f  03d8             add bx, ax                               
  1041  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  1046  66c1e810         shr eax, 0x10                            
  104a  50               push ax                                  
  104b  9af300680e       lcall 0xe68, 0xf3                        -> 0e68:00f3
  1050  83c416           add sp, 0x16                             
  1053  8bc7             mov ax, di                               
  1055  c1e002           shl ax, 2                                
  1058  c45e06           les bx, ptr [bp + 6]                     
  105b  03d8             add bx, ax                               
  105d  268b470a         mov ax, word ptr es:[bx + 0xa]           
  1061  260b470c         or ax, word ptr es:[bx + 0xc]            
  1065  7425             je 0x108c                                
  1067  c45e06           les bx, ptr [bp + 6]                     
  106a  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  1070  751a             jne 0x108c                               
  1072  8bc7             mov ax, di                               
  1074  c1e002           shl ax, 2                                
  1077  c45e06           les bx, ptr [bp + 6]                     
  107a  03d8             add bx, ax                               
  107c  26ff770c         push word ptr es:[bx + 0xc]              
  1080  26ff770a         push word ptr es:[bx + 0xa]              
  1084  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  1089  83c404           add sp, 4                                
  108c  47               inc di                                   
  108d  c45e06           les bx, ptr [bp + 6]                     
  1090  268a4734         mov al, byte ptr es:[bx + 0x34]          
  1094  b400             mov ah, 0                                
  1096  3bc7             cmp ax, di                               
  1098  7e03             jle 0x109d                               
  109a  e9f6fe           jmp 0xf93                                
  109d  c45e1a           les bx, ptr [bp + 0x1a]                  
  10a0  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  10a6  7437             je 0x10df                                
  10a8  c45e1a           les bx, ptr [bp + 0x1a]                  
  10ab  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  10b1  752c             jne 0x10df                               
  10b3  33f6             xor si, si                               
  10b5  eb1b             jmp 0x10d2                               
  10b7  8bc6             mov ax, si                               
  10b9  c1e002           shl ax, 2                                
  10bc  c45e1a           les bx, ptr [bp + 0x1a]                  
  10bf  03d8             add bx, ax                               
  10c1  26ff770c         push word ptr es:[bx + 0xc]              
  10c5  26ff770a         push word ptr es:[bx + 0xa]              
  10c9  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  10ce  83c404           add sp, 4                                
  10d1  46               inc si                                   
  10d2  c45e1a           les bx, ptr [bp + 0x1a]                  
  10d5  268a4734         mov al, byte ptr es:[bx + 0x34]          
  10d9  b400             mov ah, 0                                
  10db  3bc6             cmp ax, si                               
  10dd  7fd8             jg 0x10b7                                
  10df  c45e12           les bx, ptr [bp + 0x12]                  
  10e2  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  10e8  7437             je 0x1121                                
  10ea  c45e12           les bx, ptr [bp + 0x12]                  
  10ed  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  10f3  752c             jne 0x1121                               
  10f5  33f6             xor si, si                               
  10f7  eb1b             jmp 0x1114                               
  10f9  8bc6             mov ax, si                               
  10fb  c1e002           shl ax, 2                                
  10fe  c45e12           les bx, ptr [bp + 0x12]                  
  1101  03d8             add bx, ax                               
  1103  26ff770c         push word ptr es:[bx + 0xc]              
  1107  26ff770a         push word ptr es:[bx + 0xa]              
  110b  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  1110  83c404           add sp, 4                                
  1113  46               inc si                                   
  1114  c45e12           les bx, ptr [bp + 0x12]                  
  1117  268a4734         mov al, byte ptr es:[bx + 0x34]          
  111b  b400             mov ah, 0                                
  111d  3bc6             cmp ax, si                               
  111f  7fd8             jg 0x10f9                                
  1121  5f               pop di                                   
  1122  5e               pop si                                   
  1123  c9               leave                                    
  1124  cb               retf                                     
  1125  55               push bp                                  
