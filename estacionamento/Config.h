//
//  Config.h
//  Portaria
//
//  Created by rony tjioe chung on 11/04/16.
//  Copyright © 2016 sdc. All rights reserved.
//

//dev
#ifdef DEBUG
#    define Log(...) NSLog(__VA_ARGS__)
#    define isTesting YES
#    define shouldOpenGates NO
//prod
#else
#    define Log(...)
#    define isTesting NO
#    define shouldOpenGates YES
#endif

//config
#define app_id @""
#define app_version 0.1
#define app_name @"Weappon"

#define k_senhas @"senhas"
#define n_users 10 //without admin

#define eventType_Login @"login"
#define eventType_Logout @"logout"
#define eventType_Picture @"picture"