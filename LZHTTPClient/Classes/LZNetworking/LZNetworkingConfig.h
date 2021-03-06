

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface LZNetworkingConfig : NSObject

/**
 超时时间（默认：15）
 */
@property (assign, nonatomic) NSTimeInterval timeoutInterval;

/**
 服务器地址
 */
@property (copy, nonatomic) NSString *basePath;

/**
 验证模式（默认：AFSSLPinningModeNone）
 */
@property (nonatomic, assign) AFSSLPinningMode SSLPinningMode;

/**
 本地绑定的证书（默认：nil）
 */
@property (nonatomic, strong) NSSet <NSData *> *pinnedCertificates;

/**
 是否允许无效证书（默认：NO）
 */
@property (nonatomic, assign) BOOL allowInvalidCertificates;

/**
 是否验证域名（默认：NO）
 */
@property (nonatomic, assign) BOOL validatesDomainName;

/**
是否可以使用代理（默认：NO）
*/
@property (nonatomic, assign) BOOL isUseProxy;

/**
是否授权验证DNS（默认：NO）
*/
@property (nonatomic, assign) BOOL isAuthenticationDNS;

/**
是否过滤空对象（默认：YES）
*/
@property (nonatomic, assign) BOOL filterNullObj;

/**
 数据解析格式（默认：[NSSet setWithObjects:@"application/json",  @"text/json", @"text/javascript",@"text/html", @"text/plain", nil]）
 */
@property (copy, nonatomic) NSSet<NSString *> *acceptableContentTypes;

/**
 请求头设置字典（默认：[NSDictionary dictionaryWithObject:@"ios" forKey:@"request-type"]）
 */
@property (copy, nonatomic) NSDictionary<NSString *, NSString *> *HTTPHeaderDictionary;

/**
 以默认值创建一个配置实例

 @param basePath 服务器地址
 */
+ (instancetype)networkingConfigWithBasePath:(NSString *)basePath;

@end
