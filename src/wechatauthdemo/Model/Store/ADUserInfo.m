//
//  ADUserInfo.m
//
//  Created by Jeason  on 18/08/2015
//  Copyright (c) 2015 Tencent. All rights reserved.
//

#import "ADUserInfo.h"


NSString *const kADUserInfoOpenid = @"openid";
NSString *const kADUserInfoUin = @"uin";
NSString *const kADUserInfoMail = @"mail";
NSString *const kADUserInfoNickname = @"nickname";
NSString *const kADUserInfoPwdH1 = @"pwd_h1";
NSString *const kADUserInfoLoginTicket = @"login_ticket";
NSString *const kADUserInfoUnionid = @"unionid";
NSString *const kADUserInfoAuthCode = @"auth_code";

@interface ADUserInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ADUserInfo

@synthesize openid = _openid;
@synthesize uin = _uin;
@synthesize mail = _mail;
@synthesize nickname = _nickname;
@synthesize pwdH1 = _pwdH1;
@synthesize loginTicket = _loginTicket;
@synthesize unionid = _unionid;
@synthesize authCode = _authCode;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.openid = [self objectOrNilForKey:kADUserInfoOpenid fromDictionary:dict];
            self.uin = [[self objectOrNilForKey:kADUserInfoUin fromDictionary:dict] unsignedIntValue];
            self.mail = [self objectOrNilForKey:kADUserInfoMail fromDictionary:dict];
            self.nickname = [self objectOrNilForKey:kADUserInfoNickname fromDictionary:dict];
            self.pwdH1 = [self objectOrNilForKey:kADUserInfoPwdH1 fromDictionary:dict];
            self.loginTicket = [self objectOrNilForKey:kADUserInfoLoginTicket fromDictionary:dict];
            self.unionid = [self objectOrNilForKey:kADUserInfoUnionid fromDictionary:dict];
            self.authCode = [self objectOrNilForKey:kADUserInfoAuthCode fromDictionary:dict];
    }
    
    return self;
    
}

static ADUserInfo *currentUser_ = nil;
+ (instancetype)currentUser {
    if (currentUser_ == nil) {
        currentUser_ = [[ADUserInfo alloc] init];
    }
    return currentUser_;
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.openid forKey:kADUserInfoOpenid];
    [mutableDict setValue:@(self.uin) forKey:kADUserInfoUin];
    [mutableDict setValue:self.mail forKey:kADUserInfoMail];
    [mutableDict setValue:self.nickname forKey:kADUserInfoNickname];
    [mutableDict setValue:self.pwdH1 forKey:kADUserInfoPwdH1];
    [mutableDict setValue:self.loginTicket forKey:kADUserInfoLoginTicket];
    [mutableDict setValue:self.unionid forKey:kADUserInfoUnionid];
    [mutableDict setValue:self.authCode forKey:kADUserInfoAuthCode];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.openid = [aDecoder decodeObjectForKey:kADUserInfoOpenid];
    self.uin = [[aDecoder decodeObjectForKey:kADUserInfoUin] unsignedIntValue];
    self.mail = [aDecoder decodeObjectForKey:kADUserInfoMail];
    self.nickname = [aDecoder decodeObjectForKey:kADUserInfoNickname];
    self.pwdH1 = [aDecoder decodeObjectForKey:kADUserInfoPwdH1];
    self.loginTicket = [aDecoder decodeObjectForKey:kADUserInfoLoginTicket];
    self.unionid = [aDecoder decodeObjectForKey:kADUserInfoUnionid];
    self.authCode = [aDecoder decodeObjectForKey:kADUserInfoAuthCode];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_openid forKey:kADUserInfoOpenid];
    [aCoder encodeObject:@(_uin) forKey:kADUserInfoUin];
    [aCoder encodeObject:_mail forKey:kADUserInfoMail];
    [aCoder encodeObject:_nickname forKey:kADUserInfoNickname];
    [aCoder encodeObject:_pwdH1 forKey:kADUserInfoPwdH1];
    [aCoder encodeObject:_loginTicket forKey:kADUserInfoLoginTicket];
    [aCoder encodeObject:_unionid forKey:kADUserInfoUnionid];
    [aCoder encodeObject:_authCode forKey:kADUserInfoAuthCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    ADUserInfo *copy = [[ADUserInfo alloc] init];
    
    if (copy) {

        copy.openid = [self.openid copyWithZone:zone];
        copy.uin = self.uin;
        copy.mail = [self.mail copyWithZone:zone];
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.pwdH1 = [self.pwdH1 copyWithZone:zone];
        copy.loginTicket = [self.loginTicket copyWithZone:zone];
        copy.unionid = [self.unionid copyWithZone:zone];
        copy.authCode = [self.authCode copyWithZone:zone];
    }
    
    return copy;
}


@end