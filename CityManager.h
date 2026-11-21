#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// 城市选择器代理协议
@protocol CitySelectorDelegate <NSObject>
@optional
- (void)citySelectorDidSelect:(NSString *)provinceCode provinceName:(NSString *)provinceName 
                     cityCode:(NSString *)cityCode cityName:(NSString *)cityName 
                 districtCode:(NSString *)districtCode districtName:(NSString *)districtName;
@end

@interface CityManager : NSObject

@property(nonatomic, strong) NSDictionary *cityCodeMap;
@property(nonatomic, strong) NSDictionary *countryCodeMap;

+ (instancetype)sharedInstance;
- (NSString *)getCityNameWithCode:(NSString *)code;
- (NSString *)getProvinceNameWithCode:(NSString *)code;
- (NSString *)getCountryNameWithCode:(NSString *)code;
- (void)loadCityData;
- (void)loadCountryData;
+ (void)fetchLocationWithGeonameId:(NSString *)geonameId completionHandler:(void (^)(NSDictionary *locationInfo, NSError *error))completionHandler;
@end
