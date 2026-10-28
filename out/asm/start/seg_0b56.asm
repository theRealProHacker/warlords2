; seg 0b56  img 0xb560..0xb750  file off 0xc160
  0b56:0000  b88e09           mov ax, 0x98e                            
  0b56:0003  eb00             jmp 5                                    
  0b56:0005  cb               retf                                     
  0b56:0006  8c1efc19         mov word ptr [0x19fc], ds                
  0b56:000a  c706fa194c07     mov word ptr [0x19fa], 0x74c             
  0b56:0010  6a08             push 8                                   
  0b56:0012  1e               push ds                                  
  0b56:0013  684c07           push 0x74c                               
  0b56:0016  1e               push ds                                  
  0b56:0017  68fe19           push 0x19fe                              
  0b56:001a  9ae43f0000       lcall 0, 0x3fe4                          -> 0000:3fe4 [reloc]
  0b56:001f  83c40a           add sp, 0xa                              
  0b56:0022  6a08             push 8                                   
  0b56:0024  1e               push ds                                  
  0b56:0025  684c07           push 0x74c                               
  0b56:0028  1e               push ds                                  
  0b56:0029  68061a           push 0x1a06                              
  0b56:002c  9ae43f0000       lcall 0, 0x3fe4                          -> 0000:3fe4 [reloc]
  0b56:0031  83c40a           add sp, 0xa                              
  0b56:0034  c7060e1a0800     mov word ptr [0x1a0e], 8                 
  0b56:003a  c706531a0000     mov word ptr [0x1a53], 0                 
  0b56:0040  c706551a0f00     mov word ptr [0x1a55], 0xf               
  0b56:0046  8c1e5d1a         mov word ptr [0x1a5d], ds                
  0b56:004a  c7065b1af619     mov word ptr [0x1a5b], 0x19f6            
  0b56:0050  cb               retf                                     

proc_0b56_0051:
  0b56:0051  55               push bp                                  
  0b56:0052  8bec             mov bp, sp                               
  0b56:0054  66837e0600       cmp dword ptr [bp + 6], 0                
  0b56:0059  7503             jne 0x5e                                 
  0b56:005b  e98f00           jmp 0xed                                 
  0b56:005e  c45e06           les bx, ptr [bp + 6]                     
  0b56:0061  26f747180100     test word ptr es:[bx + 0x18], 1          
  0b56:0067  744e             je 0xb7                                  
  0b56:0069  c45e06           les bx, ptr [bp + 6]                     
  0b56:006c  26ff7757         push word ptr es:[bx + 0x57]             
  0b56:0070  c45e06           les bx, ptr [bp + 6]                     
  0b56:0073  26ff7755         push word ptr es:[bx + 0x55]             
  0b56:0077  c45e06           les bx, ptr [bp + 6]                     
  0b56:007a  26ff7706         push word ptr es:[bx + 6]                
  0b56:007e  26ff7704         push word ptr es:[bx + 4]                
  0b56:0082  c45e06           les bx, ptr [bp + 6]                     
  0b56:0085  26ff775b         push word ptr es:[bx + 0x5b]             
  0b56:0089  c45e06           les bx, ptr [bp + 6]                     
  0b56:008c  26ff7759         push word ptr es:[bx + 0x59]             
  0b56:0090  6a00             push 0                                   
  0b56:0092  6a00             push 0                                   
  0b56:0094  8b4606           mov ax, word ptr [bp + 6]                
  0b56:0097  051a00           add ax, 0x1a                             
  0b56:009a  ff7608           push word ptr [bp + 8]                   
  0b56:009d  50               push ax                                  
  0b56:009e  ff1ef615         lcall [0x15f6]                           
  0b56:00a2  83c414           add sp, 0x14                             
  0b56:00a5  8b4606           mov ax, word ptr [bp + 6]                
  0b56:00a8  051a00           add ax, 0x1a                             
  0b56:00ab  ff7608           push word ptr [bp + 8]                   
  0b56:00ae  50               push ax                                  
  0b56:00af  9af3093d08       lcall 0x83d, 0x9f3                       -> 083d:09f3 [reloc]
  0b56:00b4  83c404           add sp, 4                                
  0b56:00b7  c45e06           les bx, ptr [bp + 6]                     
  0b56:00ba  26f747180200     test word ptr es:[bx + 0x18], 2          
  0b56:00c0  7412             je 0xd4                                  
  0b56:00c2  8b4606           mov ax, word ptr [bp + 6]                
  0b56:00c5  050400           add ax, 4                                
  0b56:00c8  ff7608           push word ptr [bp + 8]                   
  0b56:00cb  50               push ax                                  
  0b56:00cc  9a0705870c       lcall 0xc87, 0x507                       -> 0c87:0507 [reloc]
  0b56:00d1  83c404           add sp, 4                                
  0b56:00d4  c45e06           les bx, ptr [bp + 6]                     
  0b56:00d7  26f747180400     test word ptr es:[bx + 0x18], 4          
  0b56:00dd  740e             je 0xed                                  
  0b56:00df  ff7608           push word ptr [bp + 8]                   
  0b56:00e2  ff7606           push word ptr [bp + 6]                   
  0b56:00e5  9a0705870c       lcall 0xc87, 0x507                       -> 0c87:0507 [reloc]
  0b56:00ea  83c404           add sp, 4                                
  0b56:00ed  5d               pop bp                                   
  0b56:00ee  cb               retf                                     

proc_0b56_00ef:
  0b56:00ef  55               push bp                                  
  0b56:00f0  8bec             mov bp, sp                               
  0b56:00f2  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b56:00f6  268b4708         mov ax, word ptr es:[bx + 8]             
  0b56:00fa  c45e06           les bx, ptr [bp + 6]                     
  0b56:00fd  260107           add word ptr es:[bx], ax                 
  0b56:0100  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b56:0104  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0b56:0108  c45e06           les bx, ptr [bp + 6]                     
  0b56:010b  26014702         add word ptr es:[bx + 2], ax             
  0b56:010f  5d               pop bp                                   
  0b56:0110  cb               retf                                     

proc_0b56_0111:
  0b56:0111  55               push bp                                  
  0b56:0112  8bec             mov bp, sp                               
  0b56:0114  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b56:0118  268b4708         mov ax, word ptr es:[bx + 8]             
  0b56:011c  c45e06           les bx, ptr [bp + 6]                     
  0b56:011f  262907           sub word ptr es:[bx], ax                 
  0b56:0122  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b56:0126  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0b56:012a  c45e06           les bx, ptr [bp + 6]                     
  0b56:012d  26294702         sub word ptr es:[bx + 2], ax             
  0b56:0131  5d               pop bp                                   
  0b56:0132  cb               retf                                     

proc_0b56_0133:
  0b56:0133  55               push bp                                  
  0b56:0134  8bec             mov bp, sp                               
  0b56:0136  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b56:013a  268b4708         mov ax, word ptr es:[bx + 8]             
  0b56:013e  c45e06           les bx, ptr [bp + 6]                     
  0b56:0141  260107           add word ptr es:[bx], ax                 
  0b56:0144  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b56:0148  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0b56:014c  c45e06           les bx, ptr [bp + 6]                     
  0b56:014f  26014702         add word ptr es:[bx + 2], ax             
  0b56:0153  5d               pop bp                                   
  0b56:0154  cb               retf                                     

proc_0b56_0155:
  0b56:0155  55               push bp                                  
  0b56:0156  8bec             mov bp, sp                               
  0b56:0158  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b56:015c  268b4708         mov ax, word ptr es:[bx + 8]             
  0b56:0160  c45e06           les bx, ptr [bp + 6]                     
  0b56:0163  268907           mov word ptr es:[bx], ax                 
  0b56:0166  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b56:016a  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0b56:016e  c45e06           les bx, ptr [bp + 6]                     
  0b56:0171  26894702         mov word ptr es:[bx + 2], ax             
  0b56:0175  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b56:0179  268b470c         mov ax, word ptr es:[bx + 0xc]           
  0b56:017d  c45e06           les bx, ptr [bp + 6]                     
  0b56:0180  26894704         mov word ptr es:[bx + 4], ax             
  0b56:0184  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b56:0188  268b470e         mov ax, word ptr es:[bx + 0xe]           
  0b56:018c  c45e06           les bx, ptr [bp + 6]                     
  0b56:018f  26894706         mov word ptr es:[bx + 6], ax             
  0b56:0193  5d               pop bp                                   
  0b56:0194  cb               retf                                     

proc_0b56_0195:
  0b56:0195  55               push bp                                  
  0b56:0196  8bec             mov bp, sp                               
  0b56:0198  56               push si                                  
  0b56:0199  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b56:019d  06               push es                                  
  0b56:019e  c47606           les si, ptr [bp + 6]                     
  0b56:01a1  268b04           mov ax, word ptr es:[si]                 
  0b56:01a4  07               pop es                                   
  0b56:01a5  26894708         mov word ptr es:[bx + 8], ax             
  0b56:01a9  c45e06           les bx, ptr [bp + 6]                     
  0b56:01ac  268b4702         mov ax, word ptr es:[bx + 2]             
  0b56:01b0  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b56:01b4  2689470a         mov word ptr es:[bx + 0xa], ax           
  0b56:01b8  c45e06           les bx, ptr [bp + 6]                     
  0b56:01bb  268b4704         mov ax, word ptr es:[bx + 4]             
  0b56:01bf  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b56:01c3  2689470c         mov word ptr es:[bx + 0xc], ax           
  0b56:01c7  c45e06           les bx, ptr [bp + 6]                     
  0b56:01ca  268b4706         mov ax, word ptr es:[bx + 6]             
  0b56:01ce  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b56:01d2  2689470e         mov word ptr es:[bx + 0xe], ax           
  0b56:01d6  5e               pop si                                   
  0b56:01d7  5d               pop bp                                   
  0b56:01d8  cb               retf                                     
  0b56:01d9  6a08             push 8                                   
  0b56:01db  1e               push ds                                  
  0b56:01dc  684c07           push 0x74c                               
  0b56:01df  1e               push ds                                  
  0b56:01e0  68fe19           push 0x19fe                              
  0b56:01e3  9ae43f0000       lcall 0, 0x3fe4                          -> 0000:3fe4 [reloc]
  0b56:01e8  83c40a           add sp, 0xa                              
  0b56:01eb  cb               retf                                     

proc_0b56_01ec:
  0b56:01ec  55               push bp                                  
  0b56:01ed  8bec             mov bp, sp                               
  0b56:01ef  c4               db c4
