#import "CustomizeViewController.h"
#import "Inspection.h"
#import "Section.h"
#import "Question.h"


@interface CustomizeViewController ()

@end

@implementation CustomizeViewController{

    Inspection* inspection;
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Question* question1 = [Question alloc];
    question1.text = @"1 text";
    
    Question* question2 = [Question alloc];
    question2.text = @"2 text";
    
    Question* question3 = [Question alloc];
    question3.text = @"3 text";
    
    Section* section1 = [Section alloc];
    section1.title = @"Section 1 title";
    section1.questions = [[NSMutableArray alloc] initWithObjects:question1,question2, nil];
    
    Section* section2 = [Section alloc];
    section2.title = @"Section 2 title";
    section2.questions = [[NSMutableArray alloc] initWithObjects:question1,question2, question3, nil];
    
    inspection = [Inspection alloc];
    inspection.title = @"Awesome inspection";
    inspection.sections = [[NSMutableArray alloc] initWithObjects:section1,section2, nil];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return inspection.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Section* theSection = [inspection.sections objectAtIndex:section];
    return theSection.questions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
    Section* theSection = [inspection.sections objectAtIndex:indexPath.section];
    Question* question = [theSection.questions objectAtIndex:indexPath.row];
    
    cell.textLabel.text = question.text;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    Section* theSection = [inspection.sections objectAtIndex:section];
    return theSection.title;
}

- (IBAction)Move:(id)sender {
    Section* section0 = [inspection.sections objectAtIndex:0];
    [inspection.sections removeObject:section0];
    [inspection.sections addObject:section0];
    
    [self.tableView moveSection:0 toSection:1];
}

@end
