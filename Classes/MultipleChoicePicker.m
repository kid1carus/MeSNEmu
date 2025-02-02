#import "MultipleChoicePicker.h"
#import "SettingsController.h"

@implementation MultipleChoicePicker

@synthesize optionNames = _optionNames;
@synthesize optionValues = _optionValues;
@synthesize pickedIndex = _pickedIndex;

@synthesize delegate = _delegate;

@end

#pragma mark -

@implementation MultipleChoicePicker(UITableViewController)

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
  return [_optionNames count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    static NSString* CellIdentifier = @"Cell";
    BOOL darkMode = [[NSUserDefaults standardUserDefaults] boolForKey:kSettingsDarkMode];
  
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    if (darkMode == YES) {
        self.view.backgroundColor = [UIColor colorWithRed:0.07 green:0.07 blue:0.08 alpha:1.0];
        tableView.separatorColor = [UIColor colorWithRed:0.07 green:0.07 blue:0.08 alpha:1.0];
        cell.backgroundColor = [UIColor colorWithRed:0.11 green:0.11 blue:0.12 alpha:1.0];
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    else {
    
    }
    cell.textLabel.text = [_optionNames objectAtIndex:indexPath.row];
    if(indexPath.row == _pickedIndex)
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    else
        cell.accessoryType = UITableViewCellAccessoryNone;

  return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
  [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_pickedIndex inSection:0]].accessoryType = UITableViewCellAccessoryNone;
  _pickedIndex = (int)indexPath.row;
  UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:indexPath];
  cell.accessoryType = UITableViewCellAccessoryCheckmark;
  [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
  
  [_delegate multipleChoice:self changedIndex:_pickedIndex];
}

@end

#pragma mark -

@implementation MultipleChoicePicker(UIViewController)

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [self.tableView reloadData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  else
    return YES;
}

@end

#pragma mark -

@implementation MultipleChoicePicker(NSObject)

- (void)dealloc
{
  [_optionNames release];
  _optionNames = nil;
  [_optionValues release];
  _optionValues = nil;
  
  [super dealloc];
}

@end
