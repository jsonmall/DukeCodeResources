//
//  TYHInternalSearchBar.m
//  TaiYangHua
//
//  Created by Lc on 16/1/19.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHInternalSearchBar.h"

@interface TYHInternalSearchBar () <UITextFieldDelegate>

@property (weak, nonatomic) UIImageView *searchBarIcon;
@property (weak, nonatomic) UITextField *searchTextField;

@end

@implementation TYHInternalSearchBar

+ (instancetype)searchBar
{
    TYHInternalSearchBar *searchBar = [[TYHInternalSearchBar alloc] init];
    
    return searchBar;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = color004deepblue;
        self.layer.cornerRadius = 15;
        [self searchBarIcon];
        [self searchTextField];
        
        __weak typeof(self) weakSelf = self;
        self.cancelButtonClickBlock = ^(){
            weakSelf.searchTextField.text = nil;
        };
    }
    
    return self;
}

#pragma mark - lazy
- (UIImageView *)searchBarIcon
{
    if (!_searchBarIcon) {
        UIImageView *searchBarIcon = [[UIImageView alloc] init];
        searchBarIcon.image = [UIImage imageNamed:@"searchIcon"];
        searchBarIcon.contentMode = UIViewContentModeCenter;
        _searchBarIcon = searchBarIcon;
        [self addSubview:_searchBarIcon];
    }
    
    return _searchBarIcon;
}

- (UITextField *)searchTextField
{
    if (!_searchTextField) {
        UITextField *searchTextField = [[UITextField alloc] init];
        searchTextField.font = [UIFont systemFontOfSize:14];
        searchTextField.textColor = [UIColor whiteColor];
        searchTextField.tintColor = [UIColor whiteColor];
        searchTextField.textAlignment = NSTextAlignmentLeft;
        searchTextField.delegate = self;
        searchTextField.keyboardType = UIReturnKeySearch;
        [searchTextField addTarget:self action:@selector(textFieldDidChange:)forControlEvents:UIControlEventEditingChanged];
        NSString *placeholderString = Localizable(@"搜索人员/讨论组");
        NSDictionary *attDict = @{NSForegroundColorAttributeName : XWColor(34, 122, 229)};
        NSAttributedString *attString = [[NSAttributedString alloc] initWithString:placeholderString attributes:attDict];
        [searchTextField setAttributedPlaceholder:attString];
        _searchTextField = searchTextField;
        [self addSubview:_searchTextField];
    }
    
    return _searchTextField;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.searchBarIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(12);
        make.top.equalTo(self).offset(4);
        make.bottom.equalTo(self).offset(-4);
        make.width.equalTo(@(15));
    }];
    
    [self.searchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.searchBarIcon.mas_right).offset(7);
        make.top.bottom.right.equalTo(self);
        
    }];
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([self.delegate respondsToSelector:@selector(searchBarDidBeginEditing:)]) {
        [self.delegate searchBarDidBeginEditing:self];
    }
}

- (void)textFieldDidChange:(UITextField *)TextField
{
    if ([self.delegate respondsToSelector:@selector(searchBarDidChangeEditing:text:)]) {
        [self.delegate searchBarDidChangeEditing:self text:TextField.text];
    }
}

@end
