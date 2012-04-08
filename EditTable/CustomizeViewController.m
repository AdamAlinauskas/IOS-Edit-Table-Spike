#import "CustomizeViewController.h"
#import "Inspection.h"
#import "Section.h"
#import "Question.h"
#import "SectionButton.h"


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
    
    [self.tableView setEditing:true];
    
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



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    Section* sectionFrom = [inspection.sections objectAtIndex:fromIndexPath.section];
    Question* questionFrom = [sectionFrom.questions objectAtIndex:fromIndexPath.row];
    [sectionFrom.questions removeObjectAtIndex:fromIndexPath.row];
    
    Section* sectionTo = [inspection.sections objectAtIndex:toIndexPath.section];
    [sectionTo.questions insertObject:questionFrom atIndex:toIndexPath.row];
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


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

-(void) moveUp:(SectionButton*)sender {
    int sectionIndex = [inspection.sections indexOfObject:sender.section];
    
    if(sectionIndex == 0)
        return;
    
    [inspection.sections removeObjectAtIndex:sectionIndex];
    
    [inspection.sections insertObject:sender.section atIndex:sectionIndex-1];
    
    
    [self.tableView moveSection:sectionIndex toSection:sectionIndex-1];
}

-(void) moveDown:(SectionButton*)sender {
    int sectionIndex = [inspection.sections indexOfObject:sender.section];
    
    if(sectionIndex == inspection.sections.count-1)
        return;
    
    [inspection.sections removeObjectAtIndex:sectionIndex];
    [inspection.sections insertObject:sender.section atIndex:sectionIndex+1];
    [self.tableView moveSection:sectionIndex toSection:sectionIndex+1];

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    Section* theSection = [inspection.sections objectAtIndex:section];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];              
    view.backgroundColor = [UIColor grayColor];
    
    UILabel* title = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    title.text = theSection.title;
    title.backgroundColor = [UIColor clearColor]; 
    
    SectionButton* up = [SectionButton buttonWithFrame:CGRectMake(100, 0, 75, 30) ];
    [up setTitle:@"Up" forState:UIControlStateNormal];
    [up addTarget:self action:@selector(moveUp:) forControlEvents:UIControlEventTouchUpInside];
    up.section = theSection;
    
    SectionButton* down = [SectionButton buttonWithFrame:CGRectMake(175, 0, 75, 30)];
    [down setTitle:@"down" forState:UIControlStateNormal];
    [down addTarget:self action:@selector(moveDown:) forControlEvents:UIControlEventTouchUpInside];
    down.section = theSection;
    
    SectionButton* addQuestion = [SectionButton buttonWithFrame: CGRectMake(250, 0, 75, 30)];
    [addQuestion setTitle:@"Add question" forState:UIControlStateNormal];
    [addQuestion addTarget:self action:@selector(addQuestion:) forControlEvents:UIControlEventTouchUpInside];
    addQuestion.section = theSection;
    
    
    [view addSubview:up];
    [view addSubview:down];
    [view addSubview:addQuestion];
    [view addSubview:title];
    
    return view;
}

-(void) addQuestion:(SectionButton*) sender{
    
    int section = [inspection.sections indexOfObject:sender.section];
    int row = sender.section.questions.count;
    
    Question* question1 = [Question alloc];
    question1.text = @"I'm New!!!!!";
    [sender.section.questions addObject:question1];
    
    NSIndexPath* path = [NSIndexPath indexPathForRow:row inSection:section];
    
    
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObjects:path, nil] withRowAnimation:UITableViewRowAnimationTop];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 35;
}

- (IBAction)AddSection:(id)sender {
    
    Section* section = [Section alloc];
    section.title = @"New Section";
    section.questions = [NSMutableArray arrayWithObjects:nil];
    
    [inspection.sections addObject:section];
    
    [self.tableView insertSections:[[NSIndexSet alloc] initWithIndex:inspection.sections.count-1] withRowAnimation:UITableViewRowAnimationLeft];
}

@end
