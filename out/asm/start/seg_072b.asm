; seg 072b  img 0x72b0..0x83d0  file off 0x7eb0
  072b:0000  0800             or byte ptr [bx + si], al                
  072b:0002  668b4606         mov eax, dword ptr [bp + 6]              
  072b:0006  66a3f406         mov dword ptr [0x6f4], eax               
  072b:000a  5d               pop bp                                   
  072b:000b  cb               retf                                     
  072b:000c  c8080000         enter 8, 0                               
  072b:0010  56               push si                                  
  072b:0011  57               push di                                  
  072b:0012  c646fd01         mov byte ptr [bp - 3], 1                 
  072b:0016  c45e06           les bx, ptr [bp + 6]                     
  072b:0019  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  072b:001f  7449             je 0x6a                                  
  072b:0021  c45e06           les bx, ptr [bp + 6]                     
  072b:0024  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  072b:002a  753e             jne 0x6a                                 
  072b:002c  33ff             xor di, di                               
  072b:002e  eb2d             jmp 0x5d                                 
  072b:0030  8bc7             mov ax, di                               
  072b:0032  c1e002           shl ax, 2                                
  072b:0035  c45e06           les bx, ptr [bp + 6]                     
  072b:0038  03d8             add bx, ax                               
  072b:003a  26ff770c         push word ptr es:[bx + 0xc]              
  072b:003e  26ff770a         push word ptr es:[bx + 0xa]              
  072b:0042  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  072b:0047  83c404           add sp, 4                                
  072b:004a  8bdf             mov bx, di                               
  072b:004c  c1e302           shl bx, 2                                
  072b:004f  c47606           les si, ptr [bp + 6]                     
  072b:0052  03f3             add si, bx                               
  072b:0054  2689541c         mov word ptr es:[si + 0x1c], dx          
  072b:0058  2689441a         mov word ptr es:[si + 0x1a], ax          
  072b:005c  47               inc di                                   
  072b:005d  c45e06           les bx, ptr [bp + 6]                     
  072b:0060  268a4734         mov al, byte ptr es:[bx + 0x34]          
  072b:0064  b400             mov ah, 0                                
  072b:0066  3bc7             cmp ax, di                               
  072b:0068  7fc6             jg 0x30                                  
  072b:006a  8b460a           mov ax, word ptr [bp + 0xa]              
  072b:006d  250700           and ax, 7                                
  072b:0070  ba0700           mov dx, 7                                
  072b:0073  2bd0             sub dx, ax                               
  072b:0075  8956fe           mov word ptr [bp - 2], dx                
  072b:0078  33f6             xor si, si                               
  072b:007a  e9c900           jmp 0x146                                
  072b:007d  56               push si                                  
  072b:007e  9a18008206       lcall 0x682, 0x18                        -> 0682:0018 [reloc]
  072b:0083  59               pop cx                                   
  072b:0084  c45e06           les bx, ptr [bp + 6]                     
  072b:0087  26f747350100     test word ptr es:[bx + 0x35], 1          
  072b:008d  744e             je 0xdd                                  
  072b:008f  c45e06           les bx, ptr [bp + 6]                     
  072b:0092  268b4706         mov ax, word ptr es:[bx + 6]             
  072b:0096  3b460c           cmp ax, word ptr [bp + 0xc]              
  072b:0099  7f42             jg 0xdd                                  
  072b:009b  c45e06           les bx, ptr [bp + 6]                     
  072b:009e  26c45f37         les bx, ptr es:[bx + 0x37]               
  072b:00a2  8bc6             mov ax, si                               
  072b:00a4  c1e002           shl ax, 2                                
  072b:00a7  03d8             add bx, ax                               
  072b:00a9  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  072b:00ad  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  072b:00b1  c45e06           les bx, ptr [bp + 6]                     
  072b:00b4  52               push dx                                  
  072b:00b5  50               push ax                                  
  072b:00b6  8b460c           mov ax, word ptr [bp + 0xc]              
  072b:00b9  262b4706         sub ax, word ptr es:[bx + 6]             
  072b:00bd  c45e06           les bx, ptr [bp + 6]                     
  072b:00c0  26c45f37         les bx, ptr es:[bx + 0x37]               
  072b:00c4  26f76f08         imul word ptr es:[bx + 8]                
  072b:00c8  d1e0             shl ax, 1                                
  072b:00ca  8bd0             mov dx, ax                               
  072b:00cc  58               pop ax                                   
  072b:00cd  03c2             add ax, dx                               
  072b:00cf  8b560a           mov dx, word ptr [bp + 0xa]              
  072b:00d2  8a0ec015         mov cl, byte ptr [0x15c0]                
  072b:00d6  d3fa             sar dx, cl                               
  072b:00d8  03c2             add ax, dx                               
  072b:00da  5a               pop dx                                   
  072b:00db  eb31             jmp 0x10e                                
  072b:00dd  8bc6             mov ax, si                               
  072b:00df  c1e002           shl ax, 2                                
  072b:00e2  c45e06           les bx, ptr [bp + 6]                     
  072b:00e5  03d8             add bx, ax                               
  072b:00e7  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  072b:00eb  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  072b:00ef  c45e06           les bx, ptr [bp + 6]                     
  072b:00f2  52               push dx                                  
  072b:00f3  50               push ax                                  
  072b:00f4  8b460c           mov ax, word ptr [bp + 0xc]              
  072b:00f7  26f76f08         imul word ptr es:[bx + 8]                
  072b:00fb  d1e0             shl ax, 1                                
  072b:00fd  8bd0             mov dx, ax                               
  072b:00ff  58               pop ax                                   
  072b:0100  03c2             add ax, dx                               
  072b:0102  8b560a           mov dx, word ptr [bp + 0xa]              
  072b:0105  8a0ec015         mov cl, byte ptr [0x15c0]                
  072b:0109  d3fa             sar dx, cl                               
  072b:010b  03c2             add ax, dx                               
  072b:010d  5a               pop dx                                   
  072b:010e  8956fa           mov word ptr [bp - 6], dx                
  072b:0111  8946f8           mov word ptr [bp - 8], ax                
  072b:0114  8a46fd           mov al, byte ptr [bp - 3]                
  072b:0117  b400             mov ah, 0                                
  072b:0119  85460e           test word ptr [bp + 0xe], ax             
  072b:011c  7404             je 0x122                                 
  072b:011e  b001             mov al, 1                                
  072b:0120  eb02             jmp 0x124                                
  072b:0122  b000             mov al, 0                                
  072b:0124  8a4efe           mov cl, byte ptr [bp - 2]                
  072b:0127  d2e0             shl al, cl                               
  072b:0129  c45ef8           les bx, ptr [bp - 8]                     
  072b:012c  268a17           mov dl, byte ptr es:[bx]                 
  072b:012f  b301             mov bl, 1                                
  072b:0131  8a4efe           mov cl, byte ptr [bp - 2]                
  072b:0134  d2e3             shl bl, cl                               
  072b:0136  f6d3             not bl                                   
  072b:0138  22d3             and dl, bl                               
  072b:013a  0ad0             or dl, al                                
  072b:013c  c45ef8           les bx, ptr [bp - 8]                     
  072b:013f  268817           mov byte ptr es:[bx], dl                 
  072b:0142  d066fd           shl byte ptr [bp - 3], 1                 
  072b:0145  46               inc si                                   
  072b:0146  c45e06           les bx, ptr [bp + 6]                     
  072b:0149  268a4734         mov al, byte ptr es:[bx + 0x34]          
  072b:014d  b400             mov ah, 0                                
  072b:014f  3bc6             cmp ax, si                               
  072b:0151  7e03             jle 0x156                                
  072b:0153  e927ff           jmp 0x7d                                 
  072b:0156  c45e06           les bx, ptr [bp + 6]                     
  072b:0159  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  072b:015f  7437             je 0x198                                 
  072b:0161  c45e06           les bx, ptr [bp + 6]                     
  072b:0164  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  072b:016a  752c             jne 0x198                                
  072b:016c  33f6             xor si, si                               
  072b:016e  eb1b             jmp 0x18b                                
  072b:0170  8bc6             mov ax, si                               
  072b:0172  c1e002           shl ax, 2                                
  072b:0175  c45e06           les bx, ptr [bp + 6]                     
  072b:0178  03d8             add bx, ax                               
  072b:017a  26ff770c         push word ptr es:[bx + 0xc]              
  072b:017e  26ff770a         push word ptr es:[bx + 0xa]              
  072b:0182  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  072b:0187  83c404           add sp, 4                                
  072b:018a  46               inc si                                   
  072b:018b  c45e06           les bx, ptr [bp + 6]                     
  072b:018e  268a4734         mov al, byte ptr es:[bx + 0x34]          
  072b:0192  b400             mov ah, 0                                
  072b:0194  3bc6             cmp ax, si                               
  072b:0196  7fd8             jg 0x170                                 
  072b:0198  5f               pop di                                   
  072b:0199  5e               pop si                                   
  072b:019a  c9               leave                                    
  072b:019b  cb               retf                                     
  072b:019c  c80c0000         enter 0xc, 0                             
  072b:01a0  56               push si                                  
  072b:01a1  57               push di                                  
  072b:01a2  c746fe0000       mov word ptr [bp - 2], 0                 
  072b:01a7  c746fc0000       mov word ptr [bp - 4], 0                 
  072b:01ac  c45e06           les bx, ptr [bp + 6]                     
  072b:01af  268b4704         mov ax, word ptr es:[bx + 4]             
  072b:01b3  c41e0908         les bx, ptr [0x809]                      
  072b:01b7  263b4704         cmp ax, word ptr es:[bx + 4]             
  072b:01bb  7216             jb 0x1d3                                 
  072b:01bd  c45e06           les bx, ptr [bp + 6]                     
  072b:01c0  268b4706         mov ax, word ptr es:[bx + 6]             
  072b:01c4  c41e0908         les bx, ptr [0x809]                      
  072b:01c8  263b4706         cmp ax, word ptr es:[bx + 6]             
  072b:01cc  7205             jb 0x1d3                                 
  072b:01ce  b80100           mov ax, 1                                
  072b:01d1  eb02             jmp 0x1d5                                
  072b:01d3  33c0             xor ax, ax                               
  072b:01d5  8946f4           mov word ptr [bp - 0xc], ax              
  072b:01d8  837ef400         cmp word ptr [bp - 0xc], 0               
  072b:01dc  7554             jne 0x232                                
  072b:01de  c45e06           les bx, ptr [bp + 6]                     
  072b:01e1  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  072b:01e7  7449             je 0x232                                 
  072b:01e9  c45e06           les bx, ptr [bp + 6]                     
  072b:01ec  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  072b:01f2  753e             jne 0x232                                
  072b:01f4  33ff             xor di, di                               
  072b:01f6  eb2d             jmp 0x225                                
  072b:01f8  8bc7             mov ax, di                               
  072b:01fa  c1e002           shl ax, 2                                
  072b:01fd  c45e06           les bx, ptr [bp + 6]                     
  072b:0200  03d8             add bx, ax                               
  072b:0202  26ff770c         push word ptr es:[bx + 0xc]              
  072b:0206  26ff770a         push word ptr es:[bx + 0xa]              
  072b:020a  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  072b:020f  83c404           add sp, 4                                
  072b:0212  8bdf             mov bx, di                               
  072b:0214  c1e302           shl bx, 2                                
  072b:0217  c47606           les si, ptr [bp + 6]                     
  072b:021a  03f3             add si, bx                               
  072b:021c  2689541c         mov word ptr es:[si + 0x1c], dx          
  072b:0220  2689441a         mov word ptr es:[si + 0x1a], ax          
  072b:0224  47               inc di                                   
  072b:0225  c45e06           les bx, ptr [bp + 6]                     
  072b:0228  268a4734         mov al, byte ptr es:[bx + 0x34]          
  072b:022c  b400             mov ah, 0                                
  072b:022e  3bc7             cmp ax, di                               
  072b:0230  7fc6             jg 0x1f8                                 
  072b:0232  8a460a           mov al, byte ptr [bp + 0xa]              
  072b:0235  2407             and al, 7                                
  072b:0237  b107             mov cl, 7                                
  072b:0239  2ac8             sub cl, al                               
  072b:023b  b001             mov al, 1                                
  072b:023d  d2e0             shl al, cl                               
  072b:023f  8846fb           mov byte ptr [bp - 5], al                
  072b:0242  33ff             xor di, di                               
  072b:0244  e94101           jmp 0x388                                
  072b:0247  837ef400         cmp word ptr [bp - 0xc], 0               
  072b:024b  744b             je 0x298                                 
  072b:024d  8bc7             mov ax, di                               
  072b:024f  c1e002           shl ax, 2                                
  072b:0252  c45e06           les bx, ptr [bp + 6]                     
  072b:0255  03d8             add bx, ax                               
  072b:0257  268b470a         mov ax, word ptr es:[bx + 0xa]           
  072b:025b  260b470c         or ax, word ptr es:[bx + 0xc]            
  072b:025f  7437             je 0x298                                 
  072b:0261  c45e06           les bx, ptr [bp + 6]                     
  072b:0264  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  072b:026a  752c             jne 0x298                                
  072b:026c  8bc7             mov ax, di                               
  072b:026e  c1e002           shl ax, 2                                
  072b:0271  c45e06           les bx, ptr [bp + 6]                     
  072b:0274  03d8             add bx, ax                               
  072b:0276  26ff770c         push word ptr es:[bx + 0xc]              
  072b:027a  26ff770a         push word ptr es:[bx + 0xa]              
  072b:027e  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  072b:0283  83c404           add sp, 4                                
  072b:0286  8bdf             mov bx, di                               
  072b:0288  c1e302           shl bx, 2                                
  072b:028b  c47606           les si, ptr [bp + 6]                     
  072b:028e  03f3             add si, bx                               
  072b:0290  2689541c         mov word ptr es:[si + 0x1c], dx          
  072b:0294  2689441a         mov word ptr es:[si + 0x1a], ax          
  072b:0298  57               push di                                  
  072b:0299  9a18008206       lcall 0x682, 0x18                        -> 0682:0018 [reloc]
  072b:029e  59               pop cx                                   
  072b:029f  c45e06           les bx, ptr [bp + 6]                     
  072b:02a2  26f747350100     test word ptr es:[bx + 0x35], 1          
  072b:02a8  744e             je 0x2f8                                 
  072b:02aa  c45e06           les bx, ptr [bp + 6]                     
  072b:02ad  268b4706         mov ax, word ptr es:[bx + 6]             
  072b:02b1  3b460c           cmp ax, word ptr [bp + 0xc]              
  072b:02b4  7f42             jg 0x2f8                                 
  072b:02b6  c45e06           les bx, ptr [bp + 6]                     
  072b:02b9  26c45f37         les bx, ptr es:[bx + 0x37]               
  072b:02bd  8bc7             mov ax, di                               
  072b:02bf  c1e002           shl ax, 2                                
  072b:02c2  03d8             add bx, ax                               
  072b:02c4  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  072b:02c8  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  072b:02cc  c45e06           les bx, ptr [bp + 6]                     
  072b:02cf  52               push dx                                  
  072b:02d0  50               push ax                                  
  072b:02d1  8b460c           mov ax, word ptr [bp + 0xc]              
  072b:02d4  262b4706         sub ax, word ptr es:[bx + 6]             
  072b:02d8  c45e06           les bx, ptr [bp + 6]                     
  072b:02db  26c45f37         les bx, ptr es:[bx + 0x37]               
  072b:02df  26f76f08         imul word ptr es:[bx + 8]                
  072b:02e3  d1e0             shl ax, 1                                
  072b:02e5  8bd0             mov dx, ax                               
  072b:02e7  58               pop ax                                   
  072b:02e8  03c2             add ax, dx                               
  072b:02ea  8b560a           mov dx, word ptr [bp + 0xa]              
  072b:02ed  8a0ec015         mov cl, byte ptr [0x15c0]                
  072b:02f1  d3fa             sar dx, cl                               
  072b:02f3  03c2             add ax, dx                               
  072b:02f5  5a               pop dx                                   
  072b:02f6  eb31             jmp 0x329                                
  072b:02f8  8bc7             mov ax, di                               
  072b:02fa  c1e002           shl ax, 2                                
  072b:02fd  c45e06           les bx, ptr [bp + 6]                     
  072b:0300  03d8             add bx, ax                               
  072b:0302  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  072b:0306  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  072b:030a  c45e06           les bx, ptr [bp + 6]                     
  072b:030d  52               push dx                                  
  072b:030e  50               push ax                                  
  072b:030f  8b460c           mov ax, word ptr [bp + 0xc]              
  072b:0312  26f76f08         imul word ptr es:[bx + 8]                
  072b:0316  d1e0             shl ax, 1                                
  072b:0318  8bd0             mov dx, ax                               
  072b:031a  58               pop ax                                   
  072b:031b  03c2             add ax, dx                               
  072b:031d  8b560a           mov dx, word ptr [bp + 0xa]              
  072b:0320  8a0ec015         mov cl, byte ptr [0x15c0]                
  072b:0324  d3fa             sar dx, cl                               
  072b:0326  03c2             add ax, dx                               
  072b:0328  5a               pop dx                                   
  072b:0329  8956f8           mov word ptr [bp - 8], dx                
  072b:032c  8946f6           mov word ptr [bp - 0xa], ax              
  072b:032f  8b4efe           mov cx, word ptr [bp - 2]                
  072b:0332  51               push cx                                  
  072b:0333  c45ef6           les bx, ptr [bp - 0xa]                   
  072b:0336  8a46fb           mov al, byte ptr [bp - 5]                
  072b:0339  268407           test byte ptr es:[bx], al                
  072b:033c  7405             je 0x343                                 
  072b:033e  b80100           mov ax, 1                                
  072b:0341  eb02             jmp 0x345                                
  072b:0343  33c0             xor ax, ax                               
  072b:0345  59               pop cx                                   
  072b:0346  d3e0             shl ax, cl                               
  072b:0348  0946fc           or word ptr [bp - 4], ax                 
  072b:034b  ff46fe           inc word ptr [bp - 2]                    
  072b:034e  8bc7             mov ax, di                               
  072b:0350  c1e002           shl ax, 2                                
  072b:0353  c45e06           les bx, ptr [bp + 6]                     
  072b:0356  03d8             add bx, ax                               
  072b:0358  268b470a         mov ax, word ptr es:[bx + 0xa]           
  072b:035c  260b470c         or ax, word ptr es:[bx + 0xc]            
  072b:0360  7425             je 0x387                                 
  072b:0362  c45e06           les bx, ptr [bp + 6]                     
  072b:0365  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  072b:036b  751a             jne 0x387                                
  072b:036d  8bc7             mov ax, di                               
  072b:036f  c1e002           shl ax, 2                                
  072b:0372  c45e06           les bx, ptr [bp + 6]                     
  072b:0375  03d8             add bx, ax                               
  072b:0377  26ff770c         push word ptr es:[bx + 0xc]              
  072b:037b  26ff770a         push word ptr es:[bx + 0xa]              
  072b:037f  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  072b:0384  83c404           add sp, 4                                
  072b:0387  47               inc di                                   
  072b:0388  c45e06           les bx, ptr [bp + 6]                     
  072b:038b  268a4734         mov al, byte ptr es:[bx + 0x34]          
  072b:038f  b400             mov ah, 0                                
  072b:0391  3bc7             cmp ax, di                               
  072b:0393  7e03             jle 0x398                                
  072b:0395  e9affe           jmp 0x247                                
  072b:0398  8b46fc           mov ax, word ptr [bp - 4]                
  072b:039b  eb00             jmp 0x39d                                
  072b:039d  5f               pop di                                   
  072b:039e  5e               pop si                                   
  072b:039f  c9               leave                                    
  072b:03a0  cb               retf                                     
  072b:03a1  c8120000         enter 0x12, 0                            
  072b:03a5  56               push si                                  
  072b:03a6  57               push di                                  
  072b:03a7  8b7e0e           mov di, word ptr [bp + 0xe]              
  072b:03aa  c746f20000       mov word ptr [bp - 0xe], 0               
  072b:03af  c746f00000       mov word ptr [bp - 0x10], 0              
  072b:03b4  c45e06           les bx, ptr [bp + 6]                     
  072b:03b7  268b4704         mov ax, word ptr es:[bx + 4]             
  072b:03bb  c41e0908         les bx, ptr [0x809]                      
  072b:03bf  263b4704         cmp ax, word ptr es:[bx + 4]             
  072b:03c3  7216             jb 0x3db                                 
  072b:03c5  c45e06           les bx, ptr [bp + 6]                     
  072b:03c8  268b4706         mov ax, word ptr es:[bx + 6]             
  072b:03cc  c41e0908         les bx, ptr [0x809]                      
  072b:03d0  263b4706         cmp ax, word ptr es:[bx + 6]             
  072b:03d4  7205             jb 0x3db                                 
  072b:03d6  b80100           mov ax, 1                                
  072b:03d9  eb02             jmp 0x3dd                                
  072b:03db  33c0             xor ax, ax                               
  072b:03dd  8946f4           mov word ptr [bp - 0xc], ax              
  072b:03e0  837ef400         cmp word ptr [bp - 0xc], 0               
  072b:03e4  755c             jne 0x442                                
  072b:03e6  c45e06           les bx, ptr [bp + 6]                     
  072b:03e9  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  072b:03ef  7451             je 0x442                                 
  072b:03f1  c45e06           les bx, ptr [bp + 6]                     
  072b:03f4  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  072b:03fa  7546             jne 0x442                                
  072b:03fc  c746ee0000       mov word ptr [bp - 0x12], 0              
  072b:0401  eb31             jmp 0x434                                
  072b:0403  8b46ee           mov ax, word ptr [bp - 0x12]             
  072b:0406  c1e002           shl ax, 2                                
  072b:0409  c45e06           les bx, ptr [bp + 6]                     
  072b:040c  03d8             add bx, ax                               
  072b:040e  26ff770c         push word ptr es:[bx + 0xc]              
  072b:0412  26ff770a         push word ptr es:[bx + 0xa]              
  072b:0416  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  072b:041b  83c404           add sp, 4                                
  072b:041e  8b5eee           mov bx, word ptr [bp - 0x12]             
  072b:0421  c1e302           shl bx, 2                                
  072b:0424  c47606           les si, ptr [bp + 6]                     
  072b:0427  03f3             add si, bx                               
  072b:0429  2689541c         mov word ptr es:[si + 0x1c], dx          
  072b:042d  2689441a         mov word ptr es:[si + 0x1a], ax          
  072b:0431  ff46ee           inc word ptr [bp - 0x12]                 
  072b:0434  c45e06           les bx, ptr [bp + 6]                     
  072b:0437  268a4734         mov al, byte ptr es:[bx + 0x34]          
  072b:043b  b400             mov ah, 0                                
  072b:043d  3b46ee           cmp ax, word ptr [bp - 0x12]             
  072b:0440  7fc1             jg 0x403                                 
  072b:0442  f7460a0700       test word ptr [bp + 0xa], 7              
  072b:0447  750d             jne 0x456                                
  072b:0449  f7c70700         test di, 7                               
  072b:044d  7507             jne 0x456                                
  072b:044f  f746160700       test word ptr [bp + 0x16], 7             
  072b:0454  7427             je 0x47d                                 
  072b:0456  ff7618           push word ptr [bp + 0x18]                
  072b:0459  ff7616           push word ptr [bp + 0x16]                
  072b:045c  ff7614           push word ptr [bp + 0x14]                
  072b:045f  ff7612           push word ptr [bp + 0x12]                
  072b:0462  ff7610           push word ptr [bp + 0x10]                
  072b:0465  57               push di                                  
  072b:0466  ff760c           push word ptr [bp + 0xc]                 
  072b:0469  ff760a           push word ptr [bp + 0xa]                 
  072b:046c  ff7608           push word ptr [bp + 8]                   
  072b:046f  ff7606           push word ptr [bp + 6]                   
  072b:0472  90               nop                                      
  072b:0473  0e               push cs                                  
  072b:0474  e80d04           call 0x884                               -> 072b:0884
  072b:0477  83c414           add sp, 0x14                             
  072b:047a  e90304           jmp 0x880                                
  072b:047d  8a0ec015         mov cl, byte ptr [0x15c0]                
  072b:0481  d3ff             sar di, cl                               
  072b:0483  8bc7             mov ax, di                               
  072b:0485  99               cdq                                      
  072b:0486  2bc2             sub ax, dx                               
  072b:0488  d1f8             sar ax, 1                                
  072b:048a  50               push ax                                  
  072b:048b  8bc7             mov ax, di                               
  072b:048d  40               inc ax                                   
  072b:048e  99               cdq                                      
  072b:048f  2bc2             sub ax, dx                               
  072b:0491  d1f8             sar ax, 1                                
  072b:0493  5a               pop dx                                   
  072b:0494  3bd0             cmp dx, ax                               
  072b:0496  7505             jne 0x49d                                
  072b:0498  b80100           mov ax, 1                                
  072b:049b  eb02             jmp 0x49f                                
  072b:049d  33c0             xor ax, ax                               
  072b:049f  8946f2           mov word ptr [bp - 0xe], ax              
  072b:04a2  8bc7             mov ax, di                               
  072b:04a4  bb0400           mov bx, 4                                
  072b:04a7  99               cdq                                      
  072b:04a8  f7fb             idiv bx                                  
  072b:04aa  50               push ax                                  
  072b:04ab  8bc7             mov ax, di                               
  072b:04ad  050300           add ax, 3                                
  072b:04b0  bb0400           mov bx, 4                                
  072b:04b3  99               cdq                                      
  072b:04b4  f7fb             idiv bx                                  
  072b:04b6  5a               pop dx                                   
  072b:04b7  3bd0             cmp dx, ax                               
  072b:04b9  7505             jne 0x4c0                                
  072b:04bb  b80100           mov ax, 1                                
  072b:04be  eb02             jmp 0x4c2                                
  072b:04c0  33c0             xor ax, ax                               
  072b:04c2  8946f0           mov word ptr [bp - 0x10], ax             
  072b:04c5  c45e06           les bx, ptr [bp + 6]                     
  072b:04c8  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  072b:04cd  c45e06           les bx, ptr [bp + 6]                     
  072b:04d0  66263b471e       cmp eax, dword ptr es:[bx + 0x1e]        
  072b:04d5  7403             je 0x4da                                 
  072b:04d7  e95c01           jmp 0x636                                
  072b:04da  c45e12           les bx, ptr [bp + 0x12]                  
  072b:04dd  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  072b:04e2  c45e12           les bx, ptr [bp + 0x12]                  
  072b:04e5  66263b471e       cmp eax, dword ptr es:[bx + 0x1e]        
  072b:04ea  7403             je 0x4ef                                 
  072b:04ec  e94701           jmp 0x636                                
  072b:04ef  6a01             push 1                                   
  072b:04f1  9a47008206       lcall 0x682, 0x47                        -> 0682:0047 [reloc]
  072b:04f6  59               pop cx                                   
  072b:04f7  9a3a008206       lcall 0x682, 0x3a                        -> 0682:003a [reloc]
  072b:04fc  c45e06           les bx, ptr [bp + 6]                     
  072b:04ff  26f747350100     test word ptr es:[bx + 0x35], 1          
  072b:0505  7443             je 0x54a                                 
  072b:0507  c45e06           les bx, ptr [bp + 6]                     
  072b:050a  268b4706         mov ax, word ptr es:[bx + 6]             
  072b:050e  3b460c           cmp ax, word ptr [bp + 0xc]              
  072b:0511  7f37             jg 0x54a                                 
  072b:0513  c45e06           les bx, ptr [bp + 6]                     
  072b:0516  8b460c           mov ax, word ptr [bp + 0xc]              
  072b:0519  262b4706         sub ax, word ptr es:[bx + 6]             
  072b:051d  c45e06           les bx, ptr [bp + 6]                     
  072b:0520  26c45f37         les bx, ptr es:[bx + 0x37]               
  072b:0524  26f76f08         imul word ptr es:[bx + 8]                
  072b:0528  d1e0             shl ax, 1                                
  072b:052a  c45e06           les bx, ptr [bp + 6]                     
  072b:052d  26c45f37         les bx, ptr es:[bx + 0x37]               
  072b:0531  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  072b:0535  50               push ax                                  
  072b:0536  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  072b:053a  5b               pop bx                                   
  072b:053b  03c3             add ax, bx                               
  072b:053d  8b5e0a           mov bx, word ptr [bp + 0xa]              
  072b:0540  8a0ec015         mov cl, byte ptr [0x15c0]                
  072b:0544  d3fb             sar bx, cl                               
  072b:0546  03c3             add ax, bx                               
  072b:0548  eb2a             jmp 0x574                                
  072b:054a  c45e06           les bx, ptr [bp + 6]                     
  072b:054d  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  072b:0551  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  072b:0555  c45e06           les bx, ptr [bp + 6]                     
  072b:0558  52               push dx                                  
  072b:0559  50               push ax                                  
  072b:055a  8b460c           mov ax, word ptr [bp + 0xc]              
  072b:055d  26f76f08         imul word ptr es:[bx + 8]                
  072b:0561  d1e0             shl ax, 1                                
  072b:0563  8bd0             mov dx, ax                               
  072b:0565  58               pop ax                                   
  072b:0566  03c2             add ax, dx                               
  072b:0568  8b560a           mov dx, word ptr [bp + 0xa]              
  072b:056b  8a0ec015         mov cl, byte ptr [0x15c0]                
  072b:056f  d3fa             sar dx, cl                               
  072b:0571  03c2             add ax, dx                               
  072b:0573  5a               pop dx                                   
  072b:0574  8956fe           mov word ptr [bp - 2], dx                
  072b:0577  8946fc           mov word ptr [bp - 4], ax                
  072b:057a  c45e12           les bx, ptr [bp + 0x12]                  
  072b:057d  26f747350100     test word ptr es:[bx + 0x35], 1          
  072b:0583  7443             je 0x5c8                                 
  072b:0585  c45e12           les bx, ptr [bp + 0x12]                  
  072b:0588  268b4706         mov ax, word ptr es:[bx + 6]             
  072b:058c  3b4618           cmp ax, word ptr [bp + 0x18]             
  072b:058f  7f37             jg 0x5c8                                 
  072b:0591  c45e12           les bx, ptr [bp + 0x12]                  
  072b:0594  8b4618           mov ax, word ptr [bp + 0x18]             
  072b:0597  262b4706         sub ax, word ptr es:[bx + 6]             
  072b:059b  c45e12           les bx, ptr [bp + 0x12]                  
  072b:059e  26c45f37         les bx, ptr es:[bx + 0x37]               
  072b:05a2  26f76f08         imul word ptr es:[bx + 8]                
  072b:05a6  d1e0             shl ax, 1                                
  072b:05a8  c45e12           les bx, ptr [bp + 0x12]                  
  072b:05ab  26c45f37         les bx, ptr es:[bx + 0x37]               
  072b:05af  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  072b:05b3  50               push ax                                  
  072b:05b4  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  072b:05b8  5b               pop bx                                   
  072b:05b9  03c3             add ax, bx                               
  072b:05bb  8b5e16           mov bx, word ptr [bp + 0x16]             
  072b:05be  8a0ec015         mov cl, byte ptr [0x15c0]                
  072b:05c2  d3fb             sar bx, cl                               
  072b:05c4  03c3             add ax, bx                               
  072b:05c6  eb2a             jmp 0x5f2                                
  072b:05c8  c45e12           les bx, ptr [bp + 0x12]                  
  072b:05cb  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  072b:05cf  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  072b:05d3  c45e12           les bx, ptr [bp + 0x12]                  
  072b:05d6  52               push dx                                  
  072b:05d7  50               push ax                                  
  072b:05d8  8b4618           mov ax, word ptr [bp + 0x18]             
  072b:05db  26f76f08         imul word ptr es:[bx + 8]                
  072b:05df  d1e0             shl ax, 1                                
  072b:05e1  8bd0             mov dx, ax                               
  072b:05e3  58               pop ax                                   
  072b:05e4  03c2             add ax, dx                               
  072b:05e6  8b5616           mov dx, word ptr [bp + 0x16]             
  072b:05e9  8a0ec015         mov cl, byte ptr [0x15c0]                
  072b:05ed  d3fa             sar dx, cl                               
  072b:05ef  03c2             add ax, dx                               
  072b:05f1  5a               pop dx                                   
  072b:05f2  8956fa           mov word ptr [bp - 6], dx                
  072b:05f5  8946f8           mov word ptr [bp - 8], ax                
  072b:05f8  c45e06           les bx, ptr [bp + 6]                     
  072b:05fb  268b4708         mov ax, word ptr es:[bx + 8]             
  072b:05ff  d1e0             shl ax, 1                                
  072b:0601  2bc7             sub ax, di                               
  072b:0603  8bd0             mov dx, ax                               
  072b:0605  c45e12           les bx, ptr [bp + 0x12]                  
  072b:0608  268b4708         mov ax, word ptr es:[bx + 8]             
  072b:060c  d1e0             shl ax, 1                                
  072b:060e  2bc7             sub ax, di                               
  072b:0610  8bd8             mov bx, ax                               
  072b:0612  53               push bx                                  
  072b:0613  52               push dx                                  
  072b:0614  57               push di                                  
  072b:0615  ff7610           push word ptr [bp + 0x10]                
  072b:0618  ff76fa           push word ptr [bp - 6]                   
  072b:061b  ff76f8           push word ptr [bp - 8]                   
  072b:061e  ff76fe           push word ptr [bp - 2]                   
  072b:0621  ff76fc           push word ptr [bp - 4]                   
  072b:0624  ff1ee615         lcall [0x15e6]                           
  072b:0628  83c410           add sp, 0x10                             
  072b:062b  6a00             push 0                                   
  072b:062d  9a47008206       lcall 0x682, 0x47                        -> 0682:0047 [reloc]
  072b:0632  59               pop cx                                   
  072b:0633  e94a02           jmp 0x880                                
  072b:0636  c746f60000       mov word ptr [bp - 0xa], 0               
  072b:063b  e93102           jmp 0x86f                                
  072b:063e  837ef400         cmp word ptr [bp - 0xc], 0               
  072b:0642  744e             je 0x692                                 
  072b:0644  8b46f6           mov ax, word ptr [bp - 0xa]              
  072b:0647  c1e002           shl ax, 2                                
  072b:064a  c45e06           les bx, ptr [bp + 6]                     
  072b:064d  03d8             add bx, ax                               
  072b:064f  268b470a         mov ax, word ptr es:[bx + 0xa]           
  072b:0653  260b470c         or ax, word ptr es:[bx + 0xc]            
  072b:0657  7439             je 0x692                                 
  072b:0659  c45e06           les bx, ptr [bp + 6]                     
  072b:065c  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  072b:0662  752e             jne 0x692                                
  072b:0664  8b46f6           mov ax, word ptr [bp - 0xa]              
  072b:0667  c1e002           shl ax, 2                                
  072b:066a  c45e06           les bx, ptr [bp + 6]                     
  072b:066d  03d8             add bx, ax                               
  072b:066f  26ff770c         push word ptr es:[bx + 0xc]              
  072b:0673  26ff770a         push word ptr es:[bx + 0xa]              
  072b:0677  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  072b:067c  83c404           add sp, 4                                
  072b:067f  8b5ef6           mov bx, word ptr [bp - 0xa]              
  072b:0682  c1e302           shl bx, 2                                
  072b:0685  c47606           les si, ptr [bp + 6]                     
  072b:0688  03f3             add si, bx                               
  072b:068a  2689541c         mov word ptr es:[si + 0x1c], dx          
  072b:068e  2689441a         mov word ptr es:[si + 0x1a], ax          
  072b:0692  ff76f6           push word ptr [bp - 0xa]                 
  072b:0695  9a18008206       lcall 0x682, 0x18                        -> 0682:0018 [reloc]
  072b:069a  59               pop cx                                   
  072b:069b  c45e06           les bx, ptr [bp + 6]                     
  072b:069e  26f747350100     test word ptr es:[bx + 0x35], 1          
  072b:06a4  744f             je 0x6f5                                 
  072b:06a6  c45e06           les bx, ptr [bp + 6]                     
  072b:06a9  268b4706         mov ax, word ptr es:[bx + 6]             
  072b:06ad  3b460c           cmp ax, word ptr [bp + 0xc]              
  072b:06b0  7f43             jg 0x6f5                                 
  072b:06b2  c45e06           les bx, ptr [bp + 6]                     
  072b:06b5  26c45f37         les bx, ptr es:[bx + 0x37]               
  072b:06b9  8b46f6           mov ax, word ptr [bp - 0xa]              
  072b:06bc  c1e002           shl ax, 2                                
  072b:06bf  03d8             add bx, ax                               
  072b:06c1  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  072b:06c5  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  072b:06c9  c45e06           les bx, ptr [bp + 6]                     
  072b:06cc  52               push dx                                  
  072b:06cd  50               push ax                                  
  072b:06ce  8b460c           mov ax, word ptr [bp + 0xc]              
  072b:06d1  262b4706         sub ax, word ptr es:[bx + 6]             
  072b:06d5  c45e06           les bx, ptr [bp + 6]                     
  072b:06d8  26c45f37         les bx, ptr es:[bx + 0x37]               
  072b:06dc  26f76f08         imul word ptr es:[bx + 8]                
  072b:06e0  d1e0             shl ax, 1                                
  072b:06e2  8bd0             mov dx, ax                               
  072b:06e4  58               pop ax                                   
  072b:06e5  03c2             add ax, dx                               
  072b:06e7  8b560a           mov dx, word ptr [bp + 0xa]              
  072b:06ea  8a0ec015         mov cl, byte ptr [0x15c0]                
  072b:06ee  d3fa             sar dx, cl                               
  072b:06f0  03c2             add ax, dx                               
  072b:06f2  5a               pop dx                                   
  072b:06f3  eb32             jmp 0x727                                
  072b:06f5  8b46f6           mov ax, word ptr [bp - 0xa]              
  072b:06f8  c1e002           shl ax, 2                                
  072b:06fb  c45e06           les bx, ptr [bp + 6]                     
  072b:06fe  03d8             add bx, ax                               
  072b:0700  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  072b:0704  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  072b:0708  c45e06           les bx, ptr [bp + 6]                     
  072b:070b  52               push dx                                  
  072b:070c  50               push ax                                  
  072b:070d  8b460c           mov ax, word ptr [bp + 0xc]              
  072b:0710  26f76f08         imul word ptr es:[bx + 8]                
  072b:0714  d1e0             shl ax, 1                                
  072b:0716  8bd0             mov dx, ax                               
  072b:0718  58               pop ax                                   
  072b:0719  03c2             add ax, dx                               
  072b:071b  8b560a           mov dx, word ptr [bp + 0xa]              
  072b:071e  8a0ec015         mov cl, byte ptr [0x15c0]                
  072b:0722  d3fa             sar dx, cl                               
  072b:0724  03c2             add ax, dx                               
  072b:0726  5a               pop dx                                   
  072b:0727  8956fe           mov word ptr [bp - 2], dx                
  072b:072a  8946fc           mov word ptr [bp - 4], ax                
  072b:072d  c45e12           les bx, ptr [bp + 0x12]                  
  072b:0730  26f747350100     test word ptr es:[bx + 0x35], 1          
  072b:0736  744f             je 0x787                                 
  072b:0738  c45e12           les bx, ptr [bp + 0x12]                  
  072b:073b  268b4706         mov ax, word ptr es:[bx + 6]             
  072b:073f  3b4618           cmp ax, word ptr [bp + 0x18]             
  072b:0742  7f43             jg 0x787                                 
  072b:0744  c45e12           les bx, ptr [bp + 0x12]                  
  072b:0747  26c45f37         les bx, ptr es:[bx + 0x37]               
  072b:074b  8b46f6           mov ax, word ptr [bp - 0xa]              
  072b:074e  c1e002           shl ax, 2                                
  072b:0751  03d8             add bx, ax                               
  072b:0753  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  072b:0757  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  072b:075b  c45e12           les bx, ptr [bp + 0x12]                  
  072b:075e  52               push dx                                  
  072b:075f  50               push ax                                  
  072b:0760  8b4618           mov ax, word ptr [bp + 0x18]             
  072b:0763  262b4706         sub ax, word ptr es:[bx + 6]             
  072b:0767  c45e12           les bx, ptr [bp + 0x12]                  
  072b:076a  26c45f37         les bx, ptr es:[bx + 0x37]               
  072b:076e  26f76f08         imul word ptr es:[bx + 8]                
  072b:0772  d1e0             shl ax, 1                                
  072b:0774  8bd0             mov dx, ax                               
  072b:0776  58               pop ax                                   
  072b:0777  03c2             add ax, dx                               
  072b:0779  8b5616           mov dx, word ptr [bp + 0x16]             
  072b:077c  8a0ec015         mov cl, byte ptr [0x15c0]                
  072b:0780  d3fa             sar dx, cl                               
  072b:0782  03c2             add ax, dx                               
  072b:0784  5a               pop dx                                   
  072b:0785  eb32             jmp 0x7b9                                
  072b:0787  8b46f6           mov ax, word ptr [bp - 0xa]              
  072b:078a  c1e002           shl ax, 2                                
  072b:078d  c45e12           les bx, ptr [bp + 0x12]                  
  072b:0790  03d8             add bx, ax                               
  072b:0792  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  072b:0796  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  072b:079a  c45e12           les bx, ptr [bp + 0x12]                  
  072b:079d  52               push dx                                  
  072b:079e  50               push ax                                  
  072b:079f  8b4618           mov ax, word ptr [bp + 0x18]             
  072b:07a2  26f76f08         imul word ptr es:[bx + 8]                
  072b:07a6  d1e0             shl ax, 1                                
  072b:07a8  8bd0             mov dx, ax                               
  072b:07aa  58               pop ax                                   
  072b:07ab  03c2             add ax, dx                               
  072b:07ad  8b5616           mov dx, word ptr [bp + 0x16]             
  072b:07b0  8a0ec015         mov cl, byte ptr [0x15c0]                
  072b:07b4  d3fa             sar dx, cl                               
  072b:07b6  03c2             add ax, dx                               
  072b:07b8  5a               pop dx                                   
  072b:07b9  8956fa           mov word ptr [bp - 6], dx                
  072b:07bc  8946f8           mov word ptr [bp - 8], ax                
  072b:07bf  c45e06           les bx, ptr [bp + 6]                     
  072b:07c2  268b4708         mov ax, word ptr es:[bx + 8]             
  072b:07c6  d1e0             shl ax, 1                                
  072b:07c8  2bc7             sub ax, di                               
  072b:07ca  8bd0             mov dx, ax                               
  072b:07cc  c45e12           les bx, ptr [bp + 0x12]                  
  072b:07cf  268b4708         mov ax, word ptr es:[bx + 8]             
  072b:07d3  d1e0             shl ax, 1                                
  072b:07d5  2bc7             sub ax, di                               
  072b:07d7  8bd8             mov bx, ax                               
  072b:07d9  837ef000         cmp word ptr [bp - 0x10], 0              
  072b:07dd  741b             je 0x7fa                                 
  072b:07df  53               push bx                                  
  072b:07e0  52               push dx                                  
  072b:07e1  57               push di                                  
  072b:07e2  ff7610           push word ptr [bp + 0x10]                
  072b:07e5  ff76fa           push word ptr [bp - 6]                   
  072b:07e8  ff76f8           push word ptr [bp - 8]                   
  072b:07eb  ff76fe           push word ptr [bp - 2]                   
  072b:07ee  ff76fc           push word ptr [bp - 4]                   
  072b:07f1  ff1ede15         lcall [0x15de]                           
  072b:07f5  83c410           add sp, 0x10                             
  072b:07f8  eb37             jmp 0x831                                
  072b:07fa  837ef200         cmp word ptr [bp - 0xe], 0               
  072b:07fe  7418             je 0x818                                 
  072b:0800  53               push bx                                  
  072b:0801  52               push dx                                  
  072b:0802  57               push di                                  
  072b:0803  ff7610           push word ptr [bp + 0x10]                
  072b:0806  ff76fa           push word ptr [bp - 6]                   
  072b:0809  ff76f8           push word ptr [bp - 8]                   
  072b:080c  ff76fe           push word ptr [bp - 2]                   
  072b:080f  ff76fc           push word ptr [bp - 4]                   
  072b:0812  ff1ee215         lcall [0x15e2]                           
  072b:0816  eb16             jmp 0x82e                                
  072b:0818  53               push bx                                  
  072b:0819  52               push dx                                  
  072b:081a  57               push di                                  
  072b:081b  ff7610           push word ptr [bp + 0x10]                
  072b:081e  ff76fa           push word ptr [bp - 6]                   
  072b:0821  ff76f8           push word ptr [bp - 8]                   
  072b:0824  ff76fe           push word ptr [bp - 2]                   
  072b:0827  ff76fc           push word ptr [bp - 4]                   
  072b:082a  ff1ee615         lcall [0x15e6]                           
  072b:082e  83c410           add sp, 0x10                             
  072b:0831  8b46f6           mov ax, word ptr [bp - 0xa]              
  072b:0834  c1e002           shl ax, 2                                
  072b:0837  c45e06           les bx, ptr [bp + 6]                     
  072b:083a  03d8             add bx, ax                               
  072b:083c  268b470a         mov ax, word ptr es:[bx + 0xa]           
  072b:0840  260b470c         or ax, word ptr es:[bx + 0xc]            
  072b:0844  7426             je 0x86c                                 
  072b:0846  c45e06           les bx, ptr [bp + 6]                     
  072b:0849  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  072b:084f  751b             jne 0x86c                                
  072b:0851  8b46f6           mov ax, word ptr [bp - 0xa]              
  072b:0854  c1e002           shl ax, 2                                
  072b:0857  c45e06           les bx, ptr [bp + 6]                     
  072b:085a  03d8             add bx, ax                               
  072b:085c  26ff770c         push word ptr es:[bx + 0xc]              
  072b:0860  26ff770a         push word ptr es:[bx + 0xa]              
  072b:0864  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  072b:0869  83c404           add sp, 4                                
  072b:086c  ff46f6           inc word ptr [bp - 0xa]                  
  072b:086f  c45e06           les bx, ptr [bp + 6]                     
  072b:0872  268a4734         mov al, byte ptr es:[bx + 0x34]          
  072b:0876  b400             mov ah, 0                                
  072b:0878  3b46f6           cmp ax, word ptr [bp - 0xa]              
  072b:087b  7e03             jle 0x880                                
  072b:087d  e9befd           jmp 0x63e                                
  072b:0880  5f               pop di                                   
  072b:0881  5e               pop si                                   
  072b:0882  c9               leave                                    
  072b:0883  cb               retf                                     
  072b:0884  c8180000         enter 0x18, 0                            
  072b:0888  56               push si                                  
  072b:0889  57               push di                                  
  072b:088a  c45e06           les bx, ptr [bp + 6]                     
  072b:088d  268b4704         mov ax, word ptr es:[bx + 4]             
  072b:0891  c41e0908         les bx, ptr [0x809]                      
  072b:0895  263b4704         cmp ax, word ptr es:[bx + 4]             
  072b:0899  7216             jb 0x8b1                                 
  072b:089b  c45e06           les bx, ptr [bp + 6]                     
  072b:089e  268b4706         mov ax, word ptr es:[bx + 6]             
  072b:08a2  c41e0908         les bx, ptr [0x809]                      
  072b:08a6  263b4706         cmp ax, word ptr es:[bx + 6]             
  072b:08aa  7205             jb 0x8b1                                 
  072b:08ac  b80100           mov ax, 1                                
  072b:08af  eb02             jmp 0x8b3                                
  072b:08b1  33c0             xor ax, ax                               
  072b:08b3  8946e8           mov word ptr [bp - 0x18], ax             
  072b:08b6  837ee800         cmp word ptr [bp - 0x18], 0              
  072b:08ba  7554             jne 0x910                                
  072b:08bc  c45e06           les bx, ptr [bp + 6]                     
  072b:08bf  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  072b:08c5  7449             je 0x910                                 
  072b:08c7  c45e06           les bx, ptr [bp + 6]                     
  072b:08ca  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  072b:08d0  753e             jne 0x910                                
  072b:08d2  33ff             xor di, di                               
  072b:08d4  eb2d             jmp 0x903                                
  072b:08d6  8bc7             mov ax, di                               
  072b:08d8  c1e002           shl ax, 2                                
  072b:08db  c45e06           les bx, ptr [bp + 6]                     
  072b:08de  03d8             add bx, ax                               
  072b:08e0  26ff770c         push word ptr es:[bx + 0xc]              
  072b:08e4  26ff770a         push word ptr es:[bx + 0xa]              
  072b:08e8  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  072b:08ed  83c404           add sp, 4                                
  072b:08f0  8bdf             mov bx, di                               
  072b:08f2  c1e302           shl bx, 2                                
  072b:08f5  c47606           les si, ptr [bp + 6]                     
  072b:08f8  03f3             add si, bx                               
  072b:08fa  2689541c         mov word ptr es:[si + 0x1c], dx          
  072b:08fe  2689441a         mov word ptr es:[si + 0x1a], ax          
  072b:0902  47               inc di                                   
  072b:0903  c45e06           les bx, ptr [bp + 6]                     
  072b:0906  268a4734         mov al, byte ptr es:[bx + 0x34]          
  072b:090a  b400             mov ah, 0                                
  072b:090c  3bc7             cmp ax, di                               
  072b:090e  7fc6             jg 0x8d6                                 
  072b:0910  8b4616           mov ax, word ptr [bp + 0x16]             
  072b:0913  2306c615         and ax, word ptr [0x15c6]                
  072b:0917  8946f2           mov word ptr [bp - 0xe], ax              
  072b:091a  8b460e           mov ax, word ptr [bp + 0xe]              
  072b:091d  2306c615         and ax, word ptr [0x15c6]                
  072b:0921  8946ee           mov word ptr [bp - 0x12], ax             
  072b:0924  8a0ec015         mov cl, byte ptr [0x15c0]                
  072b:0928  d37e0e           sar word ptr [bp + 0xe], cl              
  072b:092b  33ff             xor di, di                               
  072b:092d  e90903           jmp 0xc39                                
  072b:0930  837ee800         cmp word ptr [bp - 0x18], 0              
  072b:0934  744b             je 0x981                                 
  072b:0936  8bc7             mov ax, di                               
  072b:0938  c1e002           shl ax, 2                                
  072b:093b  c45e06           les bx, ptr [bp + 6]                     
  072b:093e  03d8             add bx, ax                               
  072b:0940  268b470a         mov ax, word ptr es:[bx + 0xa]           
  072b:0944  260b470c         or ax, word ptr es:[bx + 0xc]            
  072b:0948  7437             je 0x981                                 
  072b:094a  c45e06           les bx, ptr [bp + 6]                     
  072b:094d  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  072b:0953  752c             jne 0x981                                
  072b:0955  8bc7             mov ax, di                               
  072b:0957  c1e002           shl ax, 2                                
  072b:095a  c45e06           les bx, ptr [bp + 6]                     
  072b:095d  03d8             add bx, ax                               
  072b:095f  26ff770c         push word ptr es:[bx + 0xc]              
  072b:0963  26ff770a         push word ptr es:[bx + 0xa]              
  072b:0967  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  072b:096c  83c404           add sp, 4                                
  072b:096f  8bdf             mov bx, di                               
  072b:0971  c1e302           shl bx, 2                                
  072b:0974  c47606           les si, ptr [bp + 6]                     
  072b:0977  03f3             add si, bx                               
  072b:0979  2689541c         mov word ptr es:[si + 0x1c], dx          
  072b:097d  2689441a         mov word ptr es:[si + 0x1a], ax          
  072b:0981  57               push di                                  
  072b:0982  9a18008206       lcall 0x682, 0x18                        -> 0682:0018 [reloc]
  072b:0987  59               pop cx                                   
  072b:0988  c45e06           les bx, ptr [bp + 6]                     
  072b:098b  26f747350100     test word ptr es:[bx + 0x35], 1          
  072b:0991  744e             je 0x9e1                                 
  072b:0993  c45e06           les bx, ptr [bp + 6]                     
  072b:0996  268b4706         mov ax, word ptr es:[bx + 6]             
  072b:099a  3b460c           cmp ax, word ptr [bp + 0xc]              
  072b:099d  7f42             jg 0x9e1                                 
  072b:099f  c45e06           les bx, ptr [bp + 6]                     
  072b:09a2  26c45f37         les bx, ptr es:[bx + 0x37]               
  072b:09a6  8bc7             mov ax, di                               
  072b:09a8  c1e002           shl ax, 2                                
  072b:09ab  03d8             add bx, ax                               
  072b:09ad  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  072b:09b1  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  072b:09b5  c45e06           les bx, ptr [bp + 6]                     
  072b:09b8  52               push dx                                  
  072b:09b9  50               push ax                                  
  072b:09ba  8b460c           mov ax, word ptr [bp + 0xc]              
  072b:09bd  262b4706         sub ax, word ptr es:[bx + 6]             
  072b:09c1  c45e06           les bx, ptr [bp + 6]                     
  072b:09c4  26c45f37         les bx, ptr es:[bx + 0x37]               
  072b:09c8  26f76f08         imul word ptr es:[bx + 8]                
  072b:09cc  d1e0             shl ax, 1                                
  072b:09ce  8bd0             mov dx, ax                               
  072b:09d0  58               pop ax                                   
  072b:09d1  03c2             add ax, dx                               
  072b:09d3  8b560a           mov dx, word ptr [bp + 0xa]              
  072b:09d6  8a0ec015         mov cl, byte ptr [0x15c0]                
  072b:09da  d3fa             sar dx, cl                               
  072b:09dc  03c2             add ax, dx                               
  072b:09de  5a               pop dx                                   
  072b:09df  eb31             jmp 0xa12                                
  072b:09e1  8bc7             mov ax, di                               
  072b:09e3  c1e002           shl ax, 2                                
  072b:09e6  c45e06           les bx, ptr [bp + 6]                     
  072b:09e9  03d8             add bx, ax                               
  072b:09eb  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  072b:09ef  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  072b:09f3  c45e06           les bx, ptr [bp + 6]                     
  072b:09f6  52               push dx                                  
  072b:09f7  50               push ax                                  
  072b:09f8  8b460c           mov ax, word ptr [bp + 0xc]              
  072b:09fb  26f76f08         imul word ptr es:[bx + 8]                
  072b:09ff  d1e0             shl ax, 1                                
  072b:0a01  8bd0             mov dx, ax                               
  072b:0a03  58               pop ax                                   
  072b:0a04  03c2             add ax, dx                               
  072b:0a06  8b560a           mov dx, word ptr [bp + 0xa]              
  072b:0a09  8a0ec015         mov cl, byte ptr [0x15c0]                
  072b:0a0d  d3fa             sar dx, cl                               
  072b:0a0f  03c2             add ax, dx                               
  072b:0a11  5a               pop dx                                   
  072b:0a12  8956fa           mov word ptr [bp - 6], dx                
  072b:0a15  8946f8           mov word ptr [bp - 8], ax                
  072b:0a18  c45e12           les bx, ptr [bp + 0x12]                  
  072b:0a1b  26f747350100     test word ptr es:[bx + 0x35], 1          
  072b:0a21  744e             je 0xa71                                 
  072b:0a23  c45e12           les bx, ptr [bp + 0x12]                  
  072b:0a26  268b4706         mov ax, word ptr es:[bx + 6]             
  072b:0a2a  3b4618           cmp ax, word ptr [bp + 0x18]             
  072b:0a2d  7f42             jg 0xa71                                 
  072b:0a2f  c45e12           les bx, ptr [bp + 0x12]                  
  072b:0a32  26c45f37         les bx, ptr es:[bx + 0x37]               
  072b:0a36  8bc7             mov ax, di                               
  072b:0a38  c1e002           shl ax, 2                                
  072b:0a3b  03d8             add bx, ax                               
  072b:0a3d  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  072b:0a41  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  072b:0a45  c45e12           les bx, ptr [bp + 0x12]                  
  072b:0a48  52               push dx                                  
  072b:0a49  50               push ax                                  
  072b:0a4a  8b4618           mov ax, word ptr [bp + 0x18]             
  072b:0a4d  262b4706         sub ax, word ptr es:[bx + 6]             
  072b:0a51  c45e12           les bx, ptr [bp + 0x12]                  
  072b:0a54  26c45f37         les bx, ptr es:[bx + 0x37]               
  072b:0a58  26f76f08         imul word ptr es:[bx + 8]                
  072b:0a5c  d1e0             shl ax, 1                                
  072b:0a5e  8bd0             mov dx, ax                               
  072b:0a60  58               pop ax                                   
  072b:0a61  03c2             add ax, dx                               
  072b:0a63  8b5616           mov dx, word ptr [bp + 0x16]             
  072b:0a66  8a0ec015         mov cl, byte ptr [0x15c0]                
  072b:0a6a  d3fa             sar dx, cl                               
  072b:0a6c  03c2             add ax, dx                               
  072b:0a6e  5a               pop dx                                   
  072b:0a6f  eb31             jmp 0xaa2                                
  072b:0a71  8bc7             mov ax, di                               
  072b:0a73  c1e002           shl ax, 2                                
  072b:0a76  c45e12           les bx, ptr [bp + 0x12]                  
  072b:0a79  03d8             add bx, ax                               
  072b:0a7b  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  072b:0a7f  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  072b:0a83  c45e12           les bx, ptr [bp + 0x12]                  
  072b:0a86  52               push dx                                  
  072b:0a87  50               push ax                                  
  072b:0a88  8b4618           mov ax, word ptr [bp + 0x18]             
  072b:0a8b  26f76f08         imul word ptr es:[bx + 8]                
  072b:0a8f  d1e0             shl ax, 1                                
  072b:0a91  8bd0             mov dx, ax                               
  072b:0a93  58               pop ax                                   
  072b:0a94  03c2             add ax, dx                               
  072b:0a96  8b5616           mov dx, word ptr [bp + 0x16]             
  072b:0a99  8a0ec015         mov cl, byte ptr [0x15c0]                
  072b:0a9d  d3fa             sar dx, cl                               
  072b:0a9f  03c2             add ax, dx                               
  072b:0aa1  5a               pop dx                                   
  072b:0aa2  8956f6           mov word ptr [bp - 0xa], dx              
  072b:0aa5  8946f4           mov word ptr [bp - 0xc], ax              
  072b:0aa8  c45e06           les bx, ptr [bp + 6]                     
  072b:0aab  268b4708         mov ax, word ptr es:[bx + 8]             
  072b:0aaf  d1e0             shl ax, 1                                
  072b:0ab1  2b460e           sub ax, word ptr [bp + 0xe]              
  072b:0ab4  8946ec           mov word ptr [bp - 0x14], ax             
  072b:0ab7  c45e12           les bx, ptr [bp + 0x12]                  
  072b:0aba  268b4708         mov ax, word ptr es:[bx + 8]             
  072b:0abe  d1e0             shl ax, 1                                
  072b:0ac0  2b460e           sub ax, word ptr [bp + 0xe]              
  072b:0ac3  8946ea           mov word ptr [bp - 0x16], ax             
  072b:0ac6  8b4610           mov ax, word ptr [bp + 0x10]             
  072b:0ac9  8946f0           mov word ptr [bp - 0x10], ax             
  072b:0acc  e92301           jmp 0xbf2                                
  072b:0acf  8b5ef2           mov bx, word ptr [bp - 0xe]              
  072b:0ad2  c476f4           les si, ptr [bp - 0xc]                   
  072b:0ad5  268a04           mov al, byte ptr es:[si]                 
  072b:0ad8  22872407         and al, byte ptr [bx + 0x724]            
  072b:0adc  8846ff           mov byte ptr [bp - 1], al                
  072b:0adf  8b560e           mov dx, word ptr [bp + 0xe]              
  072b:0ae2  eb41             jmp 0xb25                                
  072b:0ae4  8b5ef2           mov bx, word ptr [bp - 0xe]              
  072b:0ae7  c476f8           les si, ptr [bp - 8]                     
  072b:0aea  268a04           mov al, byte ptr es:[si]                 
  072b:0aed  22871c07         and al, byte ptr [bx + 0x71c]            
  072b:0af1  8b5ef2           mov bx, word ptr [bp - 0xe]              
  072b:0af4  8a8f3407         mov cl, byte ptr [bx + 0x734]            
  072b:0af8  d2e0             shl al, cl                               
  072b:0afa  8846fe           mov byte ptr [bp - 2], al                
  072b:0afd  c45ef8           les bx, ptr [bp - 8]                     
  072b:0b00  268a07           mov al, byte ptr es:[bx]                 
  072b:0b03  98               cwde                                     
  072b:0b04  8a4ef2           mov cl, byte ptr [bp - 0xe]              
  072b:0b07  d3f8             sar ax, cl                               
  072b:0b09  8b5ef2           mov bx, word ptr [bp - 0xe]              
  072b:0b0c  22872c07         and al, byte ptr [bx + 0x72c]            
  072b:0b10  0a46ff           or al, byte ptr [bp - 1]                 
  072b:0b13  c45ef4           les bx, ptr [bp - 0xc]                   
  072b:0b16  268807           mov byte ptr es:[bx], al                 
  072b:0b19  ff46f8           inc word ptr [bp - 8]                    
  072b:0b1c  ff46f4           inc word ptr [bp - 0xc]                  
  072b:0b1f  8a46fe           mov al, byte ptr [bp - 2]                
  072b:0b22  8846ff           mov byte ptr [bp - 1], al                
  072b:0b25  8bc2             mov ax, dx                               
  072b:0b27  4a               dec dx                                   
  072b:0b28  0bc0             or ax, ax                                
  072b:0b2a  75b8             jne 0xae4                                
  072b:0b2c  8a46ee           mov al, byte ptr [bp - 0x12]             
  072b:0b2f  0246f2           add al, byte ptr [bp - 0xe]              
  072b:0b32  8846fd           mov byte ptr [bp - 3], al                
  072b:0b35  b400             mov ah, 0                                
  072b:0b37  3b06c615         cmp ax, word ptr [0x15c6]                
  072b:0b3b  7e6c             jle 0xba9                                
  072b:0b3d  8a46fd           mov al, byte ptr [bp - 3]                
  072b:0b40  b400             mov ah, 0                                
  072b:0b42  2b06ca15         sub ax, word ptr [0x15ca]                
  072b:0b46  8b5ef2           mov bx, word ptr [bp - 0xe]              
  072b:0b49  c476f8           les si, ptr [bp - 8]                     
  072b:0b4c  268a14           mov dl, byte ptr es:[si]                 
  072b:0b4f  22971c07         and dl, byte ptr [bx + 0x71c]            
  072b:0b53  8b5ef2           mov bx, word ptr [bp - 0xe]              
  072b:0b56  8a8f3407         mov cl, byte ptr [bx + 0x734]            
  072b:0b5a  d2e2             shl dl, cl                               
  072b:0b5c  8bd8             mov bx, ax                               
  072b:0b5e  22972407         and dl, byte ptr [bx + 0x724]            
  072b:0b62  8856fe           mov byte ptr [bp - 2], dl                
  072b:0b65  c45ef8           les bx, ptr [bp - 8]                     
  072b:0b68  268a07           mov al, byte ptr es:[bx]                 
  072b:0b6b  98               cwde                                     
  072b:0b6c  8a4ef2           mov cl, byte ptr [bp - 0xe]              
  072b:0b6f  d3f8             sar ax, cl                               
  072b:0b71  8b5ef2           mov bx, word ptr [bp - 0xe]              
  072b:0b74  22872c07         and al, byte ptr [bx + 0x72c]            
  072b:0b78  0a46ff           or al, byte ptr [bp - 1]                 
  072b:0b7b  c45ef4           les bx, ptr [bp - 0xc]                   
  072b:0b7e  268807           mov byte ptr es:[bx], al                 
  072b:0b81  8a46fe           mov al, byte ptr [bp - 2]                
  072b:0b84  8846ff           mov byte ptr [bp - 1], al                
  072b:0b87  8a46fd           mov al, byte ptr [bp - 3]                
  072b:0b8a  b400             mov ah, 0                                
  072b:0b8c  2b06ca15         sub ax, word ptr [0x15ca]                
  072b:0b90  c45ef4           les bx, ptr [bp - 0xc]                   
  072b:0b93  268a5701         mov dl, byte ptr es:[bx + 1]             
  072b:0b97  8bd8             mov bx, ax                               
  072b:0b99  22972c07         and dl, byte ptr [bx + 0x72c]            
  072b:0b9d  0a56ff           or dl, byte ptr [bp - 1]                 
  072b:0ba0  c45ef4           les bx, ptr [bp - 0xc]                   
  072b:0ba3  26885701         mov byte ptr es:[bx + 1], dl             
  072b:0ba7  eb3d             jmp 0xbe6                                
  072b:0ba9  807efd00         cmp byte ptr [bp - 3], 0                 
  072b:0bad  7437             je 0xbe6                                 
  072b:0baf  837eee00         cmp word ptr [bp - 0x12], 0              
  072b:0bb3  7417             je 0xbcc                                 
  072b:0bb5  8b5eee           mov bx, word ptr [bp - 0x12]             
  072b:0bb8  c476f8           les si, ptr [bp - 8]                     
  072b:0bbb  268a04           mov al, byte ptr es:[si]                 
  072b:0bbe  22872407         and al, byte ptr [bx + 0x724]            
  072b:0bc2  b400             mov ah, 0                                
  072b:0bc4  8a4ef2           mov cl, byte ptr [bp - 0xe]              
  072b:0bc7  d3f8             sar ax, cl                               
  072b:0bc9  0846ff           or byte ptr [bp - 1], al                 
  072b:0bcc  8a46fd           mov al, byte ptr [bp - 3]                
  072b:0bcf  b400             mov ah, 0                                
  072b:0bd1  c45ef4           les bx, ptr [bp - 0xc]                   
  072b:0bd4  268a17           mov dl, byte ptr es:[bx]                 
  072b:0bd7  8bd8             mov bx, ax                               
  072b:0bd9  22972c07         and dl, byte ptr [bx + 0x72c]            
  072b:0bdd  0a56ff           or dl, byte ptr [bp - 1]                 
  072b:0be0  c45ef4           les bx, ptr [bp - 0xc]                   
  072b:0be3  268817           mov byte ptr es:[bx], dl                 
  072b:0be6  8b46ea           mov ax, word ptr [bp - 0x16]             
  072b:0be9  0146f4           add word ptr [bp - 0xc], ax              
  072b:0bec  8b46ec           mov ax, word ptr [bp - 0x14]             
  072b:0bef  0146f8           add word ptr [bp - 8], ax                
  072b:0bf2  8b46f0           mov ax, word ptr [bp - 0x10]             
  072b:0bf5  ff4ef0           dec word ptr [bp - 0x10]                 
  072b:0bf8  0bc0             or ax, ax                                
  072b:0bfa  7403             je 0xbff                                 
  072b:0bfc  e9d0fe           jmp 0xacf                                
  072b:0bff  8bc7             mov ax, di                               
  072b:0c01  c1e002           shl ax, 2                                
  072b:0c04  c45e06           les bx, ptr [bp + 6]                     
  072b:0c07  03d8             add bx, ax                               
  072b:0c09  268b470a         mov ax, word ptr es:[bx + 0xa]           
  072b:0c0d  260b470c         or ax, word ptr es:[bx + 0xc]            
  072b:0c11  7425             je 0xc38                                 
  072b:0c13  c45e06           les bx, ptr [bp + 6]                     
  072b:0c16  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  072b:0c1c  751a             jne 0xc38                                
  072b:0c1e  8bc7             mov ax, di                               
  072b:0c20  c1e002           shl ax, 2                                
  072b:0c23  c45e06           les bx, ptr [bp + 6]                     
  072b:0c26  03d8             add bx, ax                               
  072b:0c28  26ff770c         push word ptr es:[bx + 0xc]              
  072b:0c2c  26ff770a         push word ptr es:[bx + 0xa]              
  072b:0c30  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  072b:0c35  83c404           add sp, 4                                
  072b:0c38  47               inc di                                   
  072b:0c39  c45e06           les bx, ptr [bp + 6]                     
  072b:0c3c  268a4734         mov al, byte ptr es:[bx + 0x34]          
  072b:0c40  b400             mov ah, 0                                
  072b:0c42  3bc7             cmp ax, di                               
  072b:0c44  7e03             jle 0xc49                                
  072b:0c46  e9e7fc           jmp 0x930                                
  072b:0c49  5f               pop di                                   
  072b:0c4a  5e               pop si                                   
  072b:0c4b  c9               leave                                    
  072b:0c4c  cb               retf                                     
  072b:0c4d  c8080000         enter 8, 0                               
  072b:0c51  56               push si                                  
  072b:0c52  57               push di                                  
  072b:0c53  c45e06           les bx, ptr [bp + 6]                     
  072b:0c56  8b460c           mov ax, word ptr [bp + 0xc]              
  072b:0c59  26f76f08         imul word ptr es:[bx + 8]                
  072b:0c5d  d1e0             shl ax, 1                                
  072b:0c5f  8b560a           mov dx, word ptr [bp + 0xa]              
  072b:0c62  8a0ec015         mov cl, byte ptr [0x15c0]                
  072b:0c66  d3fa             sar dx, cl                               
  072b:0c68  03c2             add ax, dx                               
  072b:0c6a  8946fe           mov word ptr [bp - 2], ax                
  072b:0c6d  c45e12           les bx, ptr [bp + 0x12]                  
  072b:0c70  8b4618           mov ax, word ptr [bp + 0x18]             
  072b:0c73  26f76f08         imul word ptr es:[bx + 8]                
  072b:0c77  d1e0             shl ax, 1                                
  072b:0c79  8b5616           mov dx, word ptr [bp + 0x16]             
  072b:0c7c  8a0ec015         mov cl, byte ptr [0x15c0]                
  072b:0c80  d3fa             sar dx, cl                               
  072b:0c82  03c2             add ax, dx                               
  072b:0c84  8946fc           mov word ptr [bp - 4], ax                
  072b:0c87  c45e1a           les bx, ptr [bp + 0x1a]                  
  072b:0c8a  8b4620           mov ax, word ptr [bp + 0x20]             
  072b:0c8d  26f76f08         imul word ptr es:[bx + 8]                
  072b:0c91  d1e0             shl ax, 1                                
  072b:0c93  8b561e           mov dx, word ptr [bp + 0x1e]             
  072b:0c96  8a0ec015         mov cl, byte ptr [0x15c0]                
  072b:0c9a  d3fa             sar dx, cl                               
  072b:0c9c  03c2             add ax, dx                               
  072b:0c9e  8946fa           mov word ptr [bp - 6], ax                
  072b:0ca1  c45e06           les bx, ptr [bp + 6]                     
  072b:0ca4  268b4704         mov ax, word ptr es:[bx + 4]             
  072b:0ca8  c41e0908         les bx, ptr [0x809]                      
  072b:0cac  263b4704         cmp ax, word ptr es:[bx + 4]             
  072b:0cb0  7216             jb 0xcc8                                 
  072b:0cb2  c45e06           les bx, ptr [bp + 6]                     
  072b:0cb5  268b4706         mov ax, word ptr es:[bx + 6]             
  072b:0cb9  c41e0908         les bx, ptr [0x809]                      
  072b:0cbd  263b4706         cmp ax, word ptr es:[bx + 6]             
  072b:0cc1  7205             jb 0xcc8                                 
  072b:0cc3  b80100           mov ax, 1                                
  072b:0cc6  eb02             jmp 0xcca                                
  072b:0cc8  33c0             xor ax, ax                               
  072b:0cca  8946f8           mov word ptr [bp - 8], ax                
  072b:0ccd  837ef800         cmp word ptr [bp - 8], 0                 
  072b:0cd1  7554             jne 0xd27                                
  072b:0cd3  c45e06           les bx, ptr [bp + 6]                     
  072b:0cd6  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  072b:0cdc  7449             je 0xd27                                 
  072b:0cde  c45e06           les bx, ptr [bp + 6]                     
  072b:0ce1  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  072b:0ce7  753e             jne 0xd27                                
  072b:0ce9  33ff             xor di, di                               
  072b:0ceb  eb2d             jmp 0xd1a                                
  072b:0ced  8bc7             mov ax, di                               
  072b:0cef  c1e002           shl ax, 2                                
  072b:0cf2  c45e06           les bx, ptr [bp + 6]                     
  072b:0cf5  03d8             add bx, ax                               
  072b:0cf7  26ff770c         push word ptr es:[bx + 0xc]              
  072b:0cfb  26ff770a         push word ptr es:[bx + 0xa]              
  072b:0cff  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  072b:0d04  83c404           add sp, 4                                
  072b:0d07  8bdf             mov bx, di                               
  072b:0d09  c1e302           shl bx, 2                                
  072b:0d0c  c47606           les si, ptr [bp + 6]                     
  072b:0d0f  03f3             add si, bx                               
  072b:0d11  2689541c         mov word ptr es:[si + 0x1c], dx          
  072b:0d15  2689441a         mov word ptr es:[si + 0x1a], ax          
  072b:0d19  47               inc di                                   
  072b:0d1a  c45e06           les bx, ptr [bp + 6]                     
  072b:0d1d  268a4734         mov al, byte ptr es:[bx + 0x34]          
  072b:0d21  b400             mov ah, 0                                
  072b:0d23  3bc7             cmp ax, di                               
  072b:0d25  7fc6             jg 0xced                                 
  072b:0d27  8cd8             mov ax, ds                               
  072b:0d29  394614           cmp word ptr [bp + 0x14], ax             
  072b:0d2c  7403             je 0xd31                                 
  072b:0d2e  e9b501           jmp 0xee6                                
  072b:0d31  817e124c07       cmp word ptr [bp + 0x12], 0x74c          
  072b:0d36  7403             je 0xd3b                                 
  072b:0d38  e9ab01           jmp 0xee6                                
  072b:0d3b  c45e1a           les bx, ptr [bp + 0x1a]                  
  072b:0d3e  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  072b:0d44  7449             je 0xd8f                                 
  072b:0d46  c45e1a           les bx, ptr [bp + 0x1a]                  
  072b:0d49  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  072b:0d4f  753e             jne 0xd8f                                
  072b:0d51  33ff             xor di, di                               
  072b:0d53  eb2d             jmp 0xd82                                
  072b:0d55  8bc7             mov ax, di                               
  072b:0d57  c1e002           shl ax, 2                                
  072b:0d5a  c45e1a           les bx, ptr [bp + 0x1a]                  
  072b:0d5d  03d8             add bx, ax                               
  072b:0d5f  26ff770c         push word ptr es:[bx + 0xc]              
  072b:0d63  26ff770a         push word ptr es:[bx + 0xa]              
  072b:0d67  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  072b:0d6c  83c404           add sp, 4                                
  072b:0d6f  8bdf             mov bx, di                               
  072b:0d71  c1e302           shl bx, 2                                
  072b:0d74  c4761a           les si, ptr [bp + 0x1a]                  
  072b:0d77  03f3             add si, bx                               
  072b:0d79  2689541c         mov word ptr es:[si + 0x1c], dx          
  072b:0d7d  2689441a         mov word ptr es:[si + 0x1a], ax          
  072b:0d81  47               inc di                                   
  072b:0d82  c45e1a           les bx, ptr [bp + 0x1a]                  
  072b:0d85  268a4734         mov al, byte ptr es:[bx + 0x34]          
  072b:0d89  b400             mov ah, 0                                
  072b:0d8b  3bc7             cmp ax, di                               
  072b:0d8d  7fc6             jg 0xd55                                 
  072b:0d8f  33ff             xor di, di                               
  072b:0d91  e9fd00           jmp 0xe91                                
  072b:0d94  837ef800         cmp word ptr [bp - 8], 0                 
  072b:0d98  744b             je 0xde5                                 
  072b:0d9a  8bc7             mov ax, di                               
  072b:0d9c  c1e002           shl ax, 2                                
  072b:0d9f  c45e06           les bx, ptr [bp + 6]                     
  072b:0da2  03d8             add bx, ax                               
  072b:0da4  268b470a         mov ax, word ptr es:[bx + 0xa]           
  072b:0da8  260b470c         or ax, word ptr es:[bx + 0xc]            
  072b:0dac  7437             je 0xde5                                 
  072b:0dae  c45e06           les bx, ptr [bp + 6]                     
  072b:0db1  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  072b:0db7  752c             jne 0xde5                                
  072b:0db9  8bc7             mov ax, di                               
  072b:0dbb  c1e002           shl ax, 2                                
  072b:0dbe  c45e06           les bx, ptr [bp + 6]                     
  072b:0dc1  03d8             add bx, ax                               
  072b:0dc3  26ff770c         push word ptr es:[bx + 0xc]              
  072b:0dc7  26ff770a         push word ptr es:[bx + 0xa]              
  072b:0dcb  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  072b:0dd0  83c404           add sp, 4                                
  072b:0dd3  8bdf             mov bx, di                               
  072b:0dd5  c1e302           shl bx, 2                                
  072b:0dd8  c47606           les si, ptr [bp + 6]                     
  072b:0ddb  03f3             add si, bx                               
  072b:0ddd  2689541c         mov word ptr es:[si + 0x1c], dx          
  072b:0de1  2689441a         mov word ptr es:[si + 0x1a], ax          
  072b:0de5  57               push di                                  
  072b:0de6  9a18008206       lcall 0x682, 0x18                        -> 0682:0018 [reloc]
  072b:0deb  59               pop cx                                   
  072b:0dec  c45e1a           les bx, ptr [bp + 0x1a]                  
  072b:0def  26ff7708         push word ptr es:[bx + 8]                
  072b:0df3  ff76fa           push word ptr [bp - 6]                   
  072b:0df6  c45e1a           les bx, ptr [bp + 0x1a]                  
  072b:0df9  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  072b:0dfe  66c1e810         shr eax, 0x10                            
  072b:0e02  50               push ax                                  
  072b:0e03  ff7610           push word ptr [bp + 0x10]                
  072b:0e06  8b460e           mov ax, word ptr [bp + 0xe]              
  072b:0e09  8a0ec215         mov cl, byte ptr [0x15c2]                
  072b:0e0d  d3f8             sar ax, cl                               
  072b:0e0f  50               push ax                                  
  072b:0e10  ff7618           push word ptr [bp + 0x18]                
  072b:0e13  8b4616           mov ax, word ptr [bp + 0x16]             
  072b:0e16  8a0ec015         mov cl, byte ptr [0x15c0]                
  072b:0e1a  d3f8             sar ax, cl                               
  072b:0e1c  50               push ax                                  
  072b:0e1d  8bc7             mov ax, di                               
  072b:0e1f  c1e002           shl ax, 2                                
  072b:0e22  c45e12           les bx, ptr [bp + 0x12]                  
  072b:0e25  03d8             add bx, ax                               
  072b:0e27  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  072b:0e2c  66c1e810         shr eax, 0x10                            
  072b:0e30  50               push ax                                  
  072b:0e31  c45e06           les bx, ptr [bp + 6]                     
  072b:0e34  26ff7708         push word ptr es:[bx + 8]                
  072b:0e38  ff76fe           push word ptr [bp - 2]                   
  072b:0e3b  8bc7             mov ax, di                               
  072b:0e3d  c1e002           shl ax, 2                                
  072b:0e40  c45e06           les bx, ptr [bp + 6]                     
  072b:0e43  03d8             add bx, ax                               
  072b:0e45  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  072b:0e4a  66c1e810         shr eax, 0x10                            
  072b:0e4e  50               push ax                                  
  072b:0e4f  9a59008206       lcall 0x682, 0x59                        -> 0682:0059 [reloc]
  072b:0e54  83c416           add sp, 0x16                             
  072b:0e57  8bc7             mov ax, di                               
  072b:0e59  c1e002           shl ax, 2                                
  072b:0e5c  c45e06           les bx, ptr [bp + 6]                     
  072b:0e5f  03d8             add bx, ax                               
  072b:0e61  268b470a         mov ax, word ptr es:[bx + 0xa]           
  072b:0e65  260b470c         or ax, word ptr es:[bx + 0xc]            
  072b:0e69  7425             je 0xe90                                 
  072b:0e6b  c45e06           les bx, ptr [bp + 6]                     
  072b:0e6e  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  072b:0e74  751a             jne 0xe90                                
  072b:0e76  8bc7             mov ax, di                               
  072b:0e78  c1e002           shl ax, 2                                
  072b:0e7b  c45e06           les bx, ptr [bp + 6]                     
  072b:0e7e  03d8             add bx, ax                               
  072b:0e80  26ff770c         push word ptr es:[bx + 0xc]              
  072b:0e84  26ff770a         push word ptr es:[bx + 0xa]              
  072b:0e88  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  072b:0e8d  83c404           add sp, 4                                
  072b:0e90  47               inc di                                   
  072b:0e91  c45e06           les bx, ptr [bp + 6]                     
  072b:0e94  268a4734         mov al, byte ptr es:[bx + 0x34]          
  072b:0e98  b400             mov ah, 0                                
  072b:0e9a  3bc7             cmp ax, di                               
  072b:0e9c  7e03             jle 0xea1                                
  072b:0e9e  e9f3fe           jmp 0xd94                                
  072b:0ea1  c45e1a           les bx, ptr [bp + 0x1a]                  
  072b:0ea4  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  072b:0eaa  7437             je 0xee3                                 
  072b:0eac  c45e1a           les bx, ptr [bp + 0x1a]                  
  072b:0eaf  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  072b:0eb5  752c             jne 0xee3                                
  072b:0eb7  33f6             xor si, si                               
  072b:0eb9  eb1b             jmp 0xed6                                
  072b:0ebb  8bc6             mov ax, si                               
  072b:0ebd  c1e002           shl ax, 2                                
  072b:0ec0  c45e1a           les bx, ptr [bp + 0x1a]                  
  072b:0ec3  03d8             add bx, ax                               
  072b:0ec5  26ff770c         push word ptr es:[bx + 0xc]              
  072b:0ec9  26ff770a         push word ptr es:[bx + 0xa]              
  072b:0ecd  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  072b:0ed2  83c404           add sp, 4                                
  072b:0ed5  46               inc si                                   
  072b:0ed6  c45e1a           les bx, ptr [bp + 0x1a]                  
  072b:0ed9  268a4734         mov al, byte ptr es:[bx + 0x34]          
  072b:0edd  b400             mov ah, 0                                
  072b:0edf  3bc6             cmp ax, si                               
  072b:0ee1  7fd8             jg 0xebb                                 
  072b:0ee3  e93b02           jmp 0x1121                               
  072b:0ee6  c45e1a           les bx, ptr [bp + 0x1a]                  
  072b:0ee9  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  072b:0eef  7449             je 0xf3a                                 
  072b:0ef1  c45e1a           les bx, ptr [bp + 0x1a]                  
  072b:0ef4  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  072b:0efa  753e             jne 0xf3a                                
  072b:0efc  33ff             xor di, di                               
  072b:0efe  eb2d             jmp 0xf2d                                
  072b:0f00  8bc7             mov ax, di                               
  072b:0f02  c1e002           shl ax, 2                                
  072b:0f05  c45e1a           les bx, ptr [bp + 0x1a]                  
  072b:0f08  03d8             add bx, ax                               
  072b:0f0a  26ff770c         push word ptr es:[bx + 0xc]              
  072b:0f0e  26ff770a         push word ptr es:[bx + 0xa]              
  072b:0f12  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  072b:0f17  83c404           add sp, 4                                
  072b:0f1a  8bdf             mov bx, di                               
  072b:0f1c  c1e302           shl bx, 2                                
  072b:0f1f  c4761a           les si, ptr [bp + 0x1a]                  
  072b:0f22  03f3             add si, bx                               
  072b:0f24  2689541c         mov word ptr es:[si + 0x1c], dx          
  072b:0f28  2689441a         mov word ptr es:[si + 0x1a], ax          
  072b:0f2c  47               inc di                                   
  072b:0f2d  c45e1a           les bx, ptr [bp + 0x1a]                  
  072b:0f30  268a4734         mov al, byte ptr es:[bx + 0x34]          
  072b:0f34  b400             mov ah, 0                                
  072b:0f36  3bc7             cmp ax, di                               
  072b:0f38  7fc6             jg 0xf00                                 
  072b:0f3a  c45e12           les bx, ptr [bp + 0x12]                  
  072b:0f3d  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  072b:0f43  7449             je 0xf8e                                 
  072b:0f45  c45e12           les bx, ptr [bp + 0x12]                  
  072b:0f48  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  072b:0f4e  753e             jne 0xf8e                                
  072b:0f50  33ff             xor di, di                               
  072b:0f52  eb2d             jmp 0xf81                                
  072b:0f54  8bc7             mov ax, di                               
  072b:0f56  c1e002           shl ax, 2                                
  072b:0f59  c45e12           les bx, ptr [bp + 0x12]                  
  072b:0f5c  03d8             add bx, ax                               
  072b:0f5e  26ff770c         push word ptr es:[bx + 0xc]              
  072b:0f62  26ff770a         push word ptr es:[bx + 0xa]              
  072b:0f66  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  072b:0f6b  83c404           add sp, 4                                
  072b:0f6e  8bdf             mov bx, di                               
  072b:0f70  c1e302           shl bx, 2                                
  072b:0f73  c47612           les si, ptr [bp + 0x12]                  
  072b:0f76  03f3             add si, bx                               
  072b:0f78  2689541c         mov word ptr es:[si + 0x1c], dx          
  072b:0f7c  2689441a         mov word ptr es:[si + 0x1a], ax          
  072b:0f80  47               inc di                                   
  072b:0f81  c45e12           les bx, ptr [bp + 0x12]                  
  072b:0f84  268a4734         mov al, byte ptr es:[bx + 0x34]          
  072b:0f88  b400             mov ah, 0                                
  072b:0f8a  3bc7             cmp ax, di                               
  072b:0f8c  7fc6             jg 0xf54                                 
  072b:0f8e  33ff             xor di, di                               
  072b:0f90  e9fa00           jmp 0x108d                               
  072b:0f93  837ef800         cmp word ptr [bp - 8], 0                 
  072b:0f97  744b             je 0xfe4                                 
  072b:0f99  8bc7             mov ax, di                               
  072b:0f9b  c1e002           shl ax, 2                                
  072b:0f9e  c45e06           les bx, ptr [bp + 6]                     
  072b:0fa1  03d8             add bx, ax                               
  072b:0fa3  268b470a         mov ax, word ptr es:[bx + 0xa]           
  072b:0fa7  260b470c         or ax, word ptr es:[bx + 0xc]            
  072b:0fab  7437             je 0xfe4                                 
  072b:0fad  c45e06           les bx, ptr [bp + 6]                     
  072b:0fb0  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  072b:0fb6  752c             jne 0xfe4                                
  072b:0fb8  8bc7             mov ax, di                               
  072b:0fba  c1e002           shl ax, 2                                
  072b:0fbd  c45e06           les bx, ptr [bp + 6]                     
  072b:0fc0  03d8             add bx, ax                               
  072b:0fc2  26ff770c         push word ptr es:[bx + 0xc]              
  072b:0fc6  26ff770a         push word ptr es:[bx + 0xa]              
  072b:0fca  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  072b:0fcf  83c404           add sp, 4                                
  072b:0fd2  8bdf             mov bx, di                               
  072b:0fd4  c1e302           shl bx, 2                                
  072b:0fd7  c47606           les si, ptr [bp + 6]                     
  072b:0fda  03f3             add si, bx                               
  072b:0fdc  2689541c         mov word ptr es:[si + 0x1c], dx          
  072b:0fe0  2689441a         mov word ptr es:[si + 0x1a], ax          
  072b:0fe4  57               push di                                  
  072b:0fe5  9a18008206       lcall 0x682, 0x18                        -> 0682:0018 [reloc]
  072b:0fea  59               pop cx                                   
  072b:0feb  c45e1a           les bx, ptr [bp + 0x1a]                  
  072b:0fee  26ff7708         push word ptr es:[bx + 8]                
  072b:0ff2  ff76fa           push word ptr [bp - 6]                   
  072b:0ff5  c45e1a           les bx, ptr [bp + 0x1a]                  
  072b:0ff8  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  072b:0ffd  66c1e810         shr eax, 0x10                            
  072b:1001  50               push ax                                  
  072b:1002  ff7610           push word ptr [bp + 0x10]                
  072b:1005  8b460e           mov ax, word ptr [bp + 0xe]              
  072b:1008  8a0ec215         mov cl, byte ptr [0x15c2]                
  072b:100c  d3f8             sar ax, cl                               
  072b:100e  50               push ax                                  
  072b:100f  c45e12           les bx, ptr [bp + 0x12]                  
  072b:1012  26ff7708         push word ptr es:[bx + 8]                
  072b:1016  ff76fc           push word ptr [bp - 4]                   
  072b:1019  8bc7             mov ax, di                               
  072b:101b  c1e002           shl ax, 2                                
  072b:101e  c45e12           les bx, ptr [bp + 0x12]                  
  072b:1021  03d8             add bx, ax                               
  072b:1023  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  072b:1028  66c1e810         shr eax, 0x10                            
  072b:102c  50               push ax                                  
  072b:102d  c45e06           les bx, ptr [bp + 6]                     
  072b:1030  26ff7708         push word ptr es:[bx + 8]                
  072b:1034  ff76fe           push word ptr [bp - 2]                   
  072b:1037  8bc7             mov ax, di                               
  072b:1039  c1e002           shl ax, 2                                
  072b:103c  c45e06           les bx, ptr [bp + 6]                     
  072b:103f  03d8             add bx, ax                               
  072b:1041  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  072b:1046  66c1e810         shr eax, 0x10                            
  072b:104a  50               push ax                                  
  072b:104b  9af3008206       lcall 0x682, 0xf3                        -> 0682:00f3 [reloc]
  072b:1050  83c416           add sp, 0x16                             
  072b:1053  8bc7             mov ax, di                               
  072b:1055  c1e002           shl ax, 2                                
  072b:1058  c45e06           les bx, ptr [bp + 6]                     
  072b:105b  03d8             add bx, ax                               
  072b:105d  268b470a         mov ax, word ptr es:[bx + 0xa]           
  072b:1061  260b470c         or ax, word ptr es:[bx + 0xc]            
  072b:1065  7425             je 0x108c                                
  072b:1067  c45e06           les bx, ptr [bp + 6]                     
  072b:106a  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  072b:1070  751a             jne 0x108c                               
  072b:1072  8bc7             mov ax, di                               
  072b:1074  c1e002           shl ax, 2                                
  072b:1077  c45e06           les bx, ptr [bp + 6]                     
  072b:107a  03d8             add bx, ax                               
  072b:107c  26ff770c         push word ptr es:[bx + 0xc]              
  072b:1080  26ff770a         push word ptr es:[bx + 0xa]              
  072b:1084  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  072b:1089  83c404           add sp, 4                                
  072b:108c  47               inc di                                   
  072b:108d  c45e06           les bx, ptr [bp + 6]                     
  072b:1090  268a4734         mov al, byte ptr es:[bx + 0x34]          
  072b:1094  b400             mov ah, 0                                
  072b:1096  3bc7             cmp ax, di                               
  072b:1098  7e03             jle 0x109d                               
  072b:109a  e9f6fe           jmp 0xf93                                
  072b:109d  c45e1a           les bx, ptr [bp + 0x1a]                  
  072b:10a0  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  072b:10a6  7437             je 0x10df                                
  072b:10a8  c45e1a           les bx, ptr [bp + 0x1a]                  
  072b:10ab  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  072b:10b1  752c             jne 0x10df                               
  072b:10b3  33f6             xor si, si                               
  072b:10b5  eb1b             jmp 0x10d2                               
  072b:10b7  8bc6             mov ax, si                               
  072b:10b9  c1e002           shl ax, 2                                
  072b:10bc  c45e1a           les bx, ptr [bp + 0x1a]                  
  072b:10bf  03d8             add bx, ax                               
  072b:10c1  26ff770c         push word ptr es:[bx + 0xc]              
  072b:10c5  26ff770a         push word ptr es:[bx + 0xa]              
  072b:10c9  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  072b:10ce  83c404           add sp, 4                                
  072b:10d1  46               inc si                                   
  072b:10d2  c45e1a           les bx, ptr [bp + 0x1a]                  
  072b:10d5  268a4734         mov al, byte ptr es:[bx + 0x34]          
  072b:10d9  b400             mov ah, 0                                
  072b:10db  3bc6             cmp ax, si                               
  072b:10dd  7fd8             jg 0x10b7                                
  072b:10df  c45e12           les bx, ptr [bp + 0x12]                  
  072b:10e2  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  072b:10e8  7437             je 0x1121                                
  072b:10ea  c45e12           les bx, ptr [bp + 0x12]                  
  072b:10ed  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  072b:10f3  752c             jne 0x1121                               
  072b:10f5  33f6             xor si, si                               
  072b:10f7  eb1b             jmp 0x1114                               
  072b:10f9  8bc6             mov ax, si                               
  072b:10fb  c1e002           shl ax, 2                                
  072b:10fe  c45e12           les bx, ptr [bp + 0x12]                  
  072b:1101  03d8             add bx, ax                               
  072b:1103  26ff770c         push word ptr es:[bx + 0xc]              
  072b:1107  26ff770a         push word ptr es:[bx + 0xa]              
  072b:110b  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  072b:1110  83c404           add sp, 4                                
  072b:1113  46               inc si                                   
  072b:1114  c45e12           les bx, ptr [bp + 0x12]                  
  072b:1117  268a4734         mov al, byte ptr es:[bx + 0x34]          
  072b:111b  b400             mov ah, 0                                
  072b:111d  3bc6             cmp ax, si                               
  072b:111f  7f               db 7f
