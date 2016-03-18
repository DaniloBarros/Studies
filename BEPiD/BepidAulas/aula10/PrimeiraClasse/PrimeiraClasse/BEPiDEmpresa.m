//
//  BEPiDEmpresa.m
//  PrimeiraClasse
//
//  Created by Danilo Barros Mendes on 2/25/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "BEPiDEmpresa.h"

@implementation BEPiDEmpresa

-(id)init{
    
    self = [super init];
    
    if(self){
        BEPiDSetor *rh = [[BEPiDSetor alloc]initWithID:0 eNome:@"RH" eFuncionarios:[[NSMutableArray alloc] init]];
        BEPiDSetor *operacional = [[BEPiDSetor alloc]initWithID:1 eNome:@"Operacional" eFuncionarios:[[NSMutableArray alloc] init]];
        BEPiDSetor *financeiro = [[BEPiDSetor alloc]initWithID:2 eNome:@"Financeiro" eFuncionarios:[[NSMutableArray alloc] init]];
        BEPiDSetor *herdeiros = [[BEPiDSetor alloc]initWithID:3 eNome:@"Herdeiros" eFuncionarios:[[NSMutableArray alloc] init]];
        
        _contador = 0;
        _anoAtual = 2015;
        
        _gastosAnuais = [[NSMutableArray alloc]init];
        
        [self setSetores:[[NSArray alloc] initWithObjects:rh, operacional, financeiro, herdeiros, nil]];
        
    }
    
    return self;
}

-(void)setSetores:(NSArray *)setores{
    _setores = [[NSArray alloc]initWithArray:setores];
}
-(NSArray *)setores{
    return [[NSArray alloc]initWithArray:_setores];
}

-(void)setGastosAnuais:(NSMutableArray *)gastos{
    _gastosAnuais = [[NSMutableArray alloc] initWithArray:gastos];
}
-(NSMutableArray *)gastosAnuais{
    return _gastosAnuais;
}

-(BOOL)menor: (int)menor
      eFunc2:(int)func2
      eFunc3:(int)func3{
    
    if(menor <= func2 && menor <= func3){
        return true;
    }else
        return false;
    
}


-(void)adicionarFuncionario: (BEPiDFuncionario *)funcionario{
    
    if (funcionario==nil || funcionario.cargo==nil){
        NSLog(@"Funcionario nulo. Nao adicionado");
        return ;
    }
    
    int funcRH = [[self setores][0]numeroDeFuncionariosSetor:[funcionario cargo]];
    int funcOP = [[self setores][1]numeroDeFuncionariosSetor:[funcionario cargo]];
    int funcFI = [[self setores][2]numeroDeFuncionariosSetor:[funcionario cargo]];
    
    if( [[funcionario cargo]isEqualToString:@"Herdeiro"] || [[funcionario cargo]isEqualToString:@"Presidente"] ){
        [[self setores][3]adicionarFuncionario:funcionario];
    
    }else if([[funcionario cargo] isEqualToString:@"Gerente"]){
        if(funcRH == 0){
            [[self setores][0]adicionarFuncionario:funcionario];
            
        }else if(funcOP == 0){
            [[self setores][1]adicionarFuncionario:funcionario];
            
        }else if(funcFI == 0){
            [[self setores][2]adicionarFuncionario:funcionario];
            
        }
        
    }else if([[funcionario cargo] isEqualToString:@"Chefe de Setor"]){
        if(funcRH <2 && [self menor:funcRH eFunc2:funcOP eFunc3:funcFI]){
            [[self setores][0]adicionarFuncionario:funcionario];
            
        }else if(funcOP <2 && [self menor:funcOP eFunc2:funcRH eFunc3:funcFI]){
            [[self setores][1]adicionarFuncionario:funcionario];
            
        }else if(funcFI <2 && [self menor:funcFI eFunc2:funcOP eFunc3:funcRH]){
            [[self setores][2]adicionarFuncionario:funcionario];
        }
        
    }else if([[funcionario cargo] isEqualToString:@"Assistente"]){
        if([self menor:funcRH eFunc2:funcOP eFunc3:funcFI]){
            [[self setores][0]adicionarFuncionario:funcionario];
            
        }else if([self menor:funcOP eFunc2:funcRH eFunc3:funcFI]){
            [[self setores][1]adicionarFuncionario:funcionario];
            
        }else if([self menor:funcFI eFunc2:funcOP eFunc3:funcRH]){
            [[self setores][2]adicionarFuncionario:funcionario];
            
        }
    }else if([[funcionario cargo] isEqualToString:@"Estagiario"]){
        if([self menor:funcRH eFunc2:funcOP eFunc3:funcFI]){
            [[self setores][0]adicionarFuncionario:funcionario];
            
        }else if([self menor:funcOP eFunc2:funcRH eFunc3:funcFI]){
            [[self setores][1]adicionarFuncionario:funcionario];
            
        }else if([self menor:funcFI eFunc2:funcOP eFunc3:funcRH]){
            [[self setores][2]adicionarFuncionario:funcionario];
            
        }
    }
    
}

-(void) criarFuncionarioNome: (NSString *)nome
                    eSalario: (float)salario{
    
    BEPiDFuncionario *funcionario = [[BEPiDFuncionario alloc]init];
    [funcionario setNome:nome];
    [funcionario setSalario:salario];
    [funcionario setId:_contador];
    _contador ++;
    
    [self adicionarFuncionario:funcionario];
    
}

-(void) criarFuncionarioNome: (NSString *)nome
                    eSalario: (float)salario
                      eCarro:(BEPiDCarro *)carro{
    
    BEPiDFuncionario *funcionario = [[BEPiDFuncionario alloc]init];
    [funcionario setNome:nome];
    [funcionario setSalario:salario];
    [funcionario setId:_contador];
    _contador ++;
    NSMutableArray *carros = [[NSMutableArray alloc]initWithObjects:carro, nil];
    [funcionario setCarro:carros];
    
    [self adicionarFuncionario:funcionario];
    
}

-(int)numeroDeFuncionarios: (NSString *)cargo{
    int cont=0;
    for(int i=0; i<[ [self setores ]count]; i++){
        for (int j=0; j<  [[[self setores][i] funcionarios]count]; j++) {
            
            if( [[[[self setores][i]funcionarios][j]cargo] isEqualToString:cargo]){
                cont++;
            }
        }
        
    }
    return cont;
}

-(BOOL)verificaCarros: (BEPiDCarro *) carro{
    
    if(carro == nil)
        return false;
    
    for (int w=0; w<[[self setores]count]; w++) {
    
    
        NSMutableArray *funcionarios = [[self setores][w] funcionarios];
    
        for (int i=0; i < [funcionarios count]; i++) {
        
            //if([_funcionarios[i] containsObject:carro] || carro!= nil){
            for (int j=0; j<[[funcionarios[i] carro]count]; j++) {
    
        
                if ([[funcionarios[i] carro][j] placa]==carro.placa && [[funcionarios[i] carro][j] modelo]==carro.modelo) {
            
                    if ([[funcionarios[i] carro][j] marca]==carro.marca && [[funcionarios[i] carro][j] cor]==carro.cor) {
                
                        if ([[funcionarios[i] carro][j] ano]==carro.ano) {
                    
                            NSLog(@"Carro ja existente para um outro funcionario");
                            return false;
                        }
                    }
                }
            }
        }
    }

    
    return true;
}


-(void)adicionaCarro:(BEPiDCarro  *)carro
             noSetor:(int)setor
            noIndice:(int)indice{
    
    if([self verificaCarros:carro] && [[self setores][setor]funcionarios][indice]!=nil){
        if([[[self setores][setor]funcionarios][indice] carro]==nil){
            [[[self setores][setor]funcionarios][indice] setCarro:[[NSMutableArray alloc]init] ];
            
        }
        [[[[self setores][setor]funcionarios][indice] carro ]addObject:carro];
        
    }else{
        NSLog(@"Carro nao adicionado.");
    }

}

-(void)presentearFuncionarios{
    
    
    BEPiDCarro *corolla = [[BEPiDCarro alloc]init];
    
    for (int i=0; i<[[self setores] count]-1; i++) {
        
        corolla = [[BEPiDCarro alloc]initWithPlaca:[NSString stringWithFormat:@"J%c%c-%d",65 + arc4random()%(90-65), 65 + arc4random()%(90-65), 1000 + arc4random()%(9999-1000)] eModelo:@"Sedan" eMarca:@"Toyota" eCor:@"Azul" eAno:[NSString stringWithFormat:@"%d", _anoAtual]];
        
        for (int j=0; j<[[[self setores][i]funcionarios] count ]; j++) {
            
            if([[[[self setores][i]funcionarios][j] cargo] isEqualToString:@"Gerente"]){
                [self adicionaCarro:corolla noSetor:i noIndice:j];
            
            }
        }
    }
    
    for (int i=0; i < [[[self setores][3]funcionarios] count ]; i++) {
        
        corolla = [[BEPiDCarro alloc]initWithPlaca:[NSString stringWithFormat:@"J%c%c-%d",65 + arc4random()%(90-65), 65 + arc4random()%(90-65), 1000 + arc4random()%(9999-1000)] eModelo:@"Sedan" eMarca:@"Toyota" eCor:@"Azul" eAno:[NSString stringWithFormat:@"%d", _anoAtual]];

        [self adicionaCarro:corolla noSetor:3 noIndice:i];
        
        
    }
    
    _anoAtual++;
    
}

-(void)aumentaSalarioImpares{
    
    for (int i=0; i<[[self setores] count]; i++) {
        for (int j=0; j<[[[self setores][i]funcionarios ] count]; j++) {
            
            if(j%2!=0){
                [[[self setores][i] funcionarios][j] aumentarSalario];
            }
        }
    }
    
}



-(void)crise{
    
    NSMutableArray *gerentes = [[NSMutableArray alloc] init];
    NSMutableArray *presidentes = [[NSMutableArray alloc] init];
    
    for (int i=0; i<[[self setores] count]; i++) {
        for (int j=0; j<[[[self setores][i]funcionarios ] count]; j++) {
            
            if([[[[self setores][i]funcionarios][j] cargo] isEqualTo:@"Estagiario"]){
                [[[self setores][i]funcionariosReal ] removeObjectAtIndex:j];
            
            }else if([[[[self setores][i]funcionarios][j] cargo] isEqualTo:@"Gerente"]){
                
                [gerentes addObject:[[self setores][i]funcionarios ][j]];
                
                [[[self setores][i]funcionariosReal ] removeObjectAtIndex:j];
            
            }else if([[[[self setores][i]funcionarios][j] cargo] isEqualTo:@"Presidente"]){
                
                [presidentes addObject:[[self setores][i]funcionarios ][j]];
                
                [[[self setores][i]funcionariosReal ] removeObjectAtIndex:j];
            }
        }
    }
    
    BEPiDFuncionario* gerente = [[BEPiDFuncionario alloc] init];
    float salario = 19999;
    [gerente setSalario:salario];
    
    for (int i=0; i<[gerentes count]; i++) {
        if([gerente salario] > [gerentes[i] salario]){
            gerente = gerentes[i];
        }
    }
    
    BEPiDFuncionario* presidente = [[BEPiDFuncionario alloc] init];
    salario = 19999;
    [presidente setSalario:salario];
    
    for (int i=0; i<[presidentes count]; i++) {
        if([presidente salario] > [presidentes[i] salario]){
            presidente = presidentes[i];
        }
    }
    
    [self adicionarFuncionario:gerente];
    [self adicionarFuncionario:presidente];
    
}

-(void)atualizarAno{
    
    [[_gastosAnuais lastObject] calcularGastoAnual];
    
    _anoAtual++;
}

-(void)calcularGastosMensais{
    float gasto=0;
    BOOL result=false;
    
    for (int i=0; i<[[self setores] count]; i++) {
        for (int j=0; j<[[[self setores][i]funcionarios ] count]; j++) {
            gasto += [[[self setores][i]funcionarios][j] salario];
        }
    }

    if([_gastosAnuais lastObject]!=nil){
        
        if([[[_gastosAnuais lastObject] gastoMensal] count]<12){
            result = [[_gastosAnuais lastObject] adicionarGastoMensal:gasto];
        
            if ([[_gastosAnuais lastObject] mes]==12) {
                [self atualizarAno];
            }
        
        }else if([[_gastosAnuais lastObject] mes]==12){
            BEPiDGastos *gastos = [[BEPiDGastos alloc] init];
        
            [gastos setAno:_anoAtual];
            result = [gastos adicionarGastoMensal:gasto];
        
            [_gastosAnuais addObject:gastos];
            
        }
    
    }else{
        NSLog(@"nulo");
        BEPiDGastos *gastos = [[BEPiDGastos alloc] init];
        [gastos setAno:_anoAtual];
        [_gastosAnuais addObject:gastos];
        
        NSLog(@"criado ultimo obj");
        [self calcularGastosMensais];
    }
    
    if(result){
        NSLog(@"Gasto do mes %lu calculado e adicionado",[[_gastosAnuais lastObject] mes]);
    }
    

}


-(NSString *)description{
    return [NSString stringWithFormat:@"Gastos %@\r%@", [self gastosAnuais] ,[self setores]];
}

@end
