---
id: 150
title: Unit Testing ViewModels In Prism Modules
date: 2013-05-25T11:49:00-04:00
author: John
layout: post
guid: https://johngilliland.wordpress.com/?p=150
permalink: /2013/05/25/unit-testing-viewmodels-in-prism-modules/
tagazine-media:
    - 'a:7:{s:7:"primary";s:80:"/assets/images/solutionexplorerscreenshot1.png";s:6:"images";a:4:{s:80:"/assets/images/solutionexplorerscreenshot1.png";a:6:{s:8:"file_url";s:80:"/assets/images/solutionexplorerscreenshot1.png";s:5:"width";i:443;s:6:"height";i:550;s:4:"type";s:5:"image";s:4:"area";i:243650;s:9:"file_path";b:0;}s:86:"/assets/images/solutionexplorerscreenshot_thumb1.png";a:6:{s:8:"file_url";s:86:"/assets/images/solutionexplorerscreenshot_thumb1.png";s:5:"width";i:376;s:6:"height";i:483;s:4:"type";s:5:"image";s:4:"area";i:181608;s:9:"file_path";b:0;}s:81:"/assets/images/solutionexplorerscreenshot21.png";a:6:{s:8:"file_url";s:81:"/assets/images/solutionexplorerscreenshot21.png";s:5:"width";i:446;s:6:"height";i:444;s:4:"type";s:5:"image";s:4:"area";i:198024;s:9:"file_path";b:0;}s:87:"/assets/images/solutionexplorerscreenshot2_thumb1.png";a:6:{s:8:"file_url";s:87:"/assets/images/solutionexplorerscreenshot2_thumb1.png";s:5:"width";i:413;s:6:"height";i:425;s:4:"type";s:5:"image";s:4:"area";i:175525;s:9:"file_path";b:0;}}s:6:"videos";a:0:{}s:11:"image_count";i:4;s:6:"author";s:7:"1621794";s:7:"blog_id";s:7:"1553479";s:9:"mod_stamp";s:19:"2013-05-25 20:34:37";}'
categories:
    - "C#"
    - Programming
    - Work
tags:
    - "C#"
    - PRISM
    - unit testing
---

<h3></h3>
<h3><span style="font-size:1.17em;">PRISM + WPF = MVVM</span></h3>
<span style="font-family:'Segoe UI';font-size:small;">All of my recent projects at work have been WPF  applications designed using the <a href="http://msdn.microsoft.com/en-us/library/gg406140.aspx" target="_blank">Microsoft PRISM framework</a> for composite/modular applications.  PRISM provides the ability to modularize our applications into separate UI modules that are decoupled from the main application and they are developed in a separate project and compiled into their own dll.  The UI module project has a bootstrapper class (of sorts) that implements the IModule interface, and in doing so, registers its views with a region in the main window.  So basically, if the dll is there then the content will show up in the main UI and if it is not, it won’t.  This is an over simplification but I am just trying to provide some context for the main issue that I want to post about.  Let us look at a simple example, a configuration/settings module.  We would have a main region (</span><a href="http://visualstudiomagazine.com/articles/2012/07/01/creating-modularity-with-wpf-prism-and-unity.aspx" target="_blank"><span style="font-family:'Segoe UI';font-size:small;">see the web for more information on Prism Regions</span></a><span style="font-family:'Segoe UI';font-size:small;">) that is likely a tab control with a tab for each major piece of the user interface, i.e. a Reports tab, a Help tab, etc.  The settings module would be a separate project and show up in the main window as its own tab.  PRISM will only show the settings module/tab if its dll is found in the bin of the application.  The settings bootstrapping class tells PRISM that it has views and which region within the main window’s layout to which the view should be linked.  Here is some code:</span>

```cs

[Module(ModuleName = &quot;SettingsModule&quot;)]
[ModuleExport(typeof(SettingsModule), InitializationMode = InitializationMode.WhenAvailable)]
public class SettingsModule : IModule
{
    private readonly IRegionViewRegistry _regionViewRegistry;

    [ImportingConstructor]
    public SettingsModule(IRegionViewRegistry registry)
    {
        _regionViewRegistry = registry;
    }

    public void Initialize()
    {
        _regionViewRegistry.RegisterViewWithRegion(RegionNames.NavigationRegion, typeof(SettingsViewItemControl));
        _regionViewRegistry.RegisterViewWithRegion(RegionNames.MainRegion, typeof(SettingsView));
    }
}

```

This is a simple implementation of the Microsoft.Practices.Prism.Modularity.IModule interface within PRISM framework.  This interface tells PRISM that this is a UI module and should be made available.  Note now the SettingsView is registered with the Main Region, which in our MainWindow xaml is a tab control marked as a PRISM region using a special attribute.

Okay, enough background.  I think it is safe to assume some familiarity with these topics or else you would not be reading this type of post.  I want to just share some experiences I had recently while writing unit tests for my “Settings Module” (the names and code types have been changed to protect the innocent).  It has never come easy, thought-process-wise, when I went to write some unit tests for my user interface classes.  So, I am posting about that thought process and sharing the resulting unit tests.  I realize that I have virtually zero audience for my blog, but on the off chance that some other developers do read this, I would sincerely benefit from any constructive feedback on my process and my unit tests.  Unit testing is a big part of my work (as it should be for all developers, right?) and I have been focusing my studies (recently, <a href="http://www.manning.com/osherove2/" target="_blank">The Art of Unit Testing 2nd Ed., Roy Osherove</a>) on this area and on the improvement of my unit tests, both in best practices and in <a href="http://msdn.microsoft.com/en-us/magazine/cc163981.aspx" target="_blank">code coverage</a>.  So…

<h3>Solution Structure</h3>
My latest feature/task at work was a configuration module (and the service that supports it) for another WPF, touch-first, application, using all of the latest goodies (Entity Framework, MEF, PRISM, .NET 4.5).  The requirements indicated that I would have a tabbed user interface with about a half-dozen different tabs, each containing a logical group of application settings that the user should be able to edit.  I set up a main settings view that held a tab control and defined a local region so that I could separate each settings tab into its own view/view model pair.  This allowed me to maintain consistency with the design of the other UI modules and with our normal best MVVM practices.  Each settings tab had a view which contains the xaml for the ui and a view model class that defines the interaction logic for the view.  So, for example, the first settings tab would consist of UserManagementSettingsView.xaml and UserManagementSettingsViewModel.cs.  Just for some further context the solution/project structure might look like this:

<a href="/assets/images/solutionexplorerscreenshot1.png"><img style="background-image:none;float:none;padding-top:0;padding-left:0;margin:0 auto 2px;display:block;padding-right:0;border:0;" title="SolutionExplorerScreenShot" alt="SolutionExplorerScreenShot" src="/assets/images/solutionexplorerscreenshot_thumb1.png" width="376" height="483" border="0" /></a>

This, of course, is just a sample structure that I just created in an empty/new solution so that I could grab a screen shot of it for this article.  I do not want to use actual code/solution from my work as it is all protected by confidentiality and it is all considered a work product that is owned by our clients, not by myself.  Don’t want to get myself into any trouble.  But, that said, I think that you can get the idea form this sample structure.  The Modules.Settings project is laid out like all of the other ui modules that I might make for an application.  There are directories for views, view models and controls, with the SettingsModule.cs class in the root of the project.  This is the bootstrapper for the module and where the above shown code might live, implementing the IModule interface and tying the various views in the ui module to their respective regions in the layout.  In the case of our example “Settings” module I would make a containing view for the modules content that is a tab control and would define a local PRISM region called Settings region.  Each of the individual settings views, i.e. ReportSettingsView would then be registered with the SettingsRegion and would consequently show up in the tab control that is defined in SettingsView.xaml.  So I would end up with a Settings view that was filled with various settings tabs.  All nice and structured.

You might also note there is a ViewModels directory within the module project where all of the ViewModel classes live.  Each view has a corresponding view model class, named accordingly.  This is typical of the MVVM design pattern that PRISM employs.  Each view’s view model contains properties that define any values and/or commands that are used to create the view.  So, for instance, in a ReportSettingsView I might want to display settings for Default Printer, Default Paper Size, and other reports related settings.  Consequently the ReportSettingsViewModel class would have properties for these values that bind to the xaml in the view and that is how data is displayed.  This binding and population of values in the view is fundamental to the MVVM pattern.  There is nothing in the view’s code-behind except coded to tie the view model in and a call to InitalizeComponents which creates the views content.

The unit tests that are needed for this type of UI module class library center around the view model classes, not the views.  The views themselves have very little code, as I mentioned, only what is needed to set the view model to the right type and to initialize the xaml.  All of the unit test fixtures will be matched to view model types, not to the view types.  Therefore I will have a unit test project called WpfApplication1.Modules.Settings.Tests that corresponds to this class library and that will contain all of the test fixtures.  Here is another shot of the structure for the unit test project for this ui module.

<a href="/assets/images/solutionexplorerscreenshot21.png"><img style="background-image:none;float:none;padding-top:0;padding-left:0;margin-left:auto;display:block;padding-right:0;margin-right:auto;border:0;" title="SolutionExplorerScreenShot2" alt="SolutionExplorerScreenShot2" src="/assets/images/solutionexplorerscreenshot2_thumb1.png" width="413" height="425" border="0" /></a>

Notice that the structure of the test project matches that of the module’s class library project shown in the previous screenshot.  Any test fixture class is located in the same place within that structure, so all of the view model fixtures are in the ViewModels directory the same as the view model classes themselves are.  This is a habit I have always had, not sure where I picked it up, that makes it easy to match a test fixture to a class.  The employed naming conventions also go to that end, the word Test or Tests is added to the tested unit’s name so that matching tests to units is that much easier.

Notice also, that there are no test fixture classes for the views, and no Views directory within the Test project’s structure.  Again, the views are not unit tested.  There isn’t really anything to test in them.  Just to prove that point, for anyone that may doubt that, here is the code behind for one of our example views:

```cs

namespace WpfApplication1.Modules.Settings.Views
{
    /// &lt;summary&gt;
    /// Interaction logic for SettingsView.xaml
    /// &lt;/summary&gt;
    public partial class SettingsView
    {
        /// &lt;summary&gt;
        /// Initializes a new instance of the &lt;see cref=&quot;SettingsView&quot;/&gt; class.
        /// &lt;/summary&gt;
        [ImportingConstructor]
        public SettingsView()
        {
            InitializeComponent();
        }

        /// &lt;summary&gt;
        /// Sets the view model using MEF import.
        /// &lt;/summary&gt;
        [Import]
        public SettingsViewModel ViewModel
        {
            set
            {
                this.DataContext = value;
            }
        }
    }
}

```

You can see that there is nothing to unit test here.  Both the constructor and the single write-only property are handled by MEF importing.  <a href="http://msdn.microsoft.com/en-us/library/dd460648.aspx" target="_blank">MEF</a> is used through out the solution to matching views to view models in this fashion.  The data context for each view’s binding is imported using MEF Import attribute on the ViewModel property that is setup for each view.  This plumbing is part of setting up each view and cannot be overlooked.  It is also possible to use <a href="http://msdn.microsoft.com/en-us/library/dn223671(v=pandp.30).aspx" target="_blank">Unity Dependency Injection</a> with PRISM and many people do.  Also it is possible to use PRISM with MEF for modularity and Unity for dependency injection, together but that is a debate for another time.

<h3>Unit Testing the View Models</h3>
So when the time comes to unit test my ui modules I previously have dreaded it, not sure why, mainly because it just hasn’t come naturally to me.  Usually when writing unit tests for, let us say an application service, it just flows.  I am able to easily see what should be tested and fairly easily write the tests.  The only issues being making sure that I am able to mock my dependencies easily.  But for view models it isn’t as simple.  I am never sure just what should be tested and how to test it.  So let us look at some examples.  First, here is a view model for one of my settings views:

```cs

[Export]
[HasSelfValidation]
public class VolumeSettingsViewModel : BaseSettingsViewModel&lt;VolumeSettingsViewModel&gt;
{
    private decimal _macroMinimumFlushVolume;

    private decimal _macroMinimumPrimeVolume;

    private decimal _manifoldMinimumFlushVolume;

    private decimal _microMinimumFlushVolume;

    private decimal _microMinimumPrimeVolume;

    /// &lt;summary&gt;
    /// Initializes a new instance of the &lt;see cref=&quot;VolumeSettingsViewModel&quot;/&gt; class.
    /// &lt;/summary&gt;
    /// &lt;param name=&quot;serviceAggregator&quot;&gt;The service aggregator.&lt;/param&gt;
    /// &lt;param name=&quot;settingsController&quot;&gt;The settings controller.&lt;/param&gt;
    [ImportingConstructor]
    public VolumeSettingsViewModel(IServiceAggregator serviceAggregator, ISettingsController settingsController)
        : base(serviceAggregator)
    {
        DisplayName = Resources.Properties.Resources.VolumeSettingsView_DisplayName;

        settingsController.RegisterSettingsViewModel(this);

        RegisterProperties();
        Initialize();
    }

    [RangeValidator(typeof(decimal), Constants.MinMacroFlushRange, RangeBoundaryType.Inclusive, Constants.MaxMacroFlushRange,
        RangeBoundaryType.Inclusive, MessageTemplateResourceName = &quot;VolumeView_RangeErrorMessage&quot;,
        MessageTemplateResourceType = typeof(Res))]
    public decimal MacroMinimumFlushVolume
    {
        get
        {
            return _macroMinimumFlushVolume;
        }
        set
        {
            if (value.Equals(_macroMinimumFlushVolume))
            {
                return;
            }
            _macroMinimumFlushVolume = value;
            RaisePropertyChanged(() =&gt; MacroMinimumFlushVolume);
            IsDirty = true;
        }
    }

    [RangeValidator(typeof(decimal), Constants.MinMacroPrimeRange, RangeBoundaryType.Inclusive, Constants.MaxMacroPrimeRange,
        RangeBoundaryType.Inclusive, MessageTemplateResourceName = &quot;VolumeSettingsView_RangeErrorMessage&quot;,
        MessageTemplateResourceType = typeof(Res))]
    public decimal MacroMinimumPrimeVolume
    {
        get
        {
            return _macroMinimumPrimeVolume;
        }
        set
        {
            if (value.Equals(_macroMinimumPrimeVolume))
            {
                return;
            }
            _macroMinimumPrimeVolume = value;
            RaisePropertyChanged(() =&gt; MacroMinimumPrimeVolume);
            IsDirty = true;
        }
    }

    [RangeValidator(typeof(decimal), Constants.MinManifoldFlushRange, RangeBoundaryType.Inclusive, Constants.MaxManifoldFlushRange,
        RangeBoundaryType.Inclusive, MessageTemplateResourceName = &quot;VolumeSettingsView_RangeErrorMessage&quot;,
        MessageTemplateResourceType = typeof(Res))]
    public decimal ManifoldMinimumFlushVolume
    {
        get
        {
            return _manifoldMinimumFlushVolume;
        }
        set
        {
            if (value.Equals(_manifoldMinimumFlushVolume))
            {
                return;
            }
            _manifoldMinimumFlushVolume = value;
            RaisePropertyChanged(() =&gt; ManifoldMinimumFlushVolume);
            IsDirty = true;
        }
    }

    [RangeValidator(typeof(decimal), Constants.MinMicroFlushRange, RangeBoundaryType.Inclusive, Constants.MaxMicroFlushRange,
        RangeBoundaryType.Inclusive, MessageTemplateResourceName = &quot;VolumeSettingsView_RangeErrorMessage&quot;,
        MessageTemplateResourceType = typeof(Res))]
    public decimal MicroMinimumFlushVolume
    {
        get
        {
            return _microMinimumFlushVolume;
        }
        set
        {
            if (value.Equals(_microMinimumFlushVolume))
            {
                return;
            }
            _microMinimumFlushVolume = value;
            RaisePropertyChanged(() =&gt; MicroMinimumFlushVolume);
            IsDirty = true;
        }
    }

    [RangeValidator(typeof(decimal), Constants.MinMicroPrimeRange, RangeBoundaryType.Inclusive, Constants.MaxMicroPrimeRange,
        RangeBoundaryType.Inclusive, MessageTemplateResourceName = &quot;VolumeSettingsView_RangeErrorMessage&quot;,
        MessageTemplateResourceType = typeof(Res))]
    public decimal MicroMinimumPrimeVolume
    {
        get
        {
            return _microMinimumPrimeVolume;
        }
        set
        {
            if (value.Equals(_microMinimumPrimeVolume))
            {
                return;
            }
            _microMinimumPrimeVolume = value;
            RaisePropertyChanged(() =&gt; MicroMinimumPrimeVolume);
            IsDirty = true;
        }
    }

    protected override sealed void Initialize()
    {
        base.Initialize();
    }

    protected override sealed void RegisterProperties()
    {
        RegisterProperty(() =&gt; MicroMinimumPrimeVolume);
        RegisterProperty(() =&gt; MacroMinimumPrimeVolume);
        RegisterProperty(() =&gt; MacroMinimumFlushVolume);
        RegisterProperty(() =&gt; MicroMinimumFlushVolume);
        RegisterProperty(() =&gt; ManifoldMinimumFlushVolume);
    }

    #endregion
}
```

This is a new view called VolumeSettingsView that allows the user to setup some minimum volume amounts for a dispensing device.  I have altered it a little bit in order to simplify and somewhat obscure its real purpose.  I did not want to have to completely write a new view and view model so this is from a work project but as I said, I have kind of dumbed it down a bit.  But as you can see from the view model code, there are 5 values for the user to edit and they are represented by properties on the view model.  There is also some plumbing code in the form of the BaseSettingsViewModel.  The base class implements the connection to the service class that provides and stores these values.  I will not go into how it all works, but generally speaking it uses reflection to pull setters and getters for both the view model and the target service so that the updating of values to/from the service is done by the base class and can be re-used for all of the settings view models.  Pretty sweet.  The last method, RegisterProperties is what sets this all up.  The lambda expressions passed in are used to reflect the getters and setters so that it can all be automated.  Anyways, lets get to some unit tests.  I never have seen the need to unit test C# and .NET library code as that is handled by the authors at Microsoft, so no need to exercise the getters and setters for the view model properties, so let us start with the constructor.  That is usually my first point of entry when I am starting my unit tests.  So,

What does the constructor do?  Let us look at the code:

```cs

/// &lt;summary&gt;
/// Initializes a new instance of the &lt;see cref=&quot;VolumeSettingsViewModel&quot;/&gt; class.
/// &lt;/summary&gt;
/// &lt;param name=&quot;serviceAggregator&quot;&gt;The service aggregator.&lt;/param&gt;
/// &lt;param name=&quot;settingsController&quot;&gt;The settings controller.&lt;/param&gt;
[ImportingConstructor]
public VolumeSettingsViewModel(IServiceAggregator serviceAggregator, ISettingsController settingsController)
    : base(serviceAggregator)
{
    DisplayName = Resources.Properties.Resources.PrimeFlushSettingsView_DisplayName;

    settingsController.RegisterSettingsViewModel(this);

    RegisterProperties();
    Initialize();
}
```

a. First we set a DisplayName property from a resource string.  This is a base class property that happens to be the text for the tab item, but it needs to be set, so we can test that.

b.  Second, a method on the settings controller class is called to register the view model with the controller.  In this particular implementation I used a controller class for the module.  I do not always do this, only when necessary.

<blockquote>In this case, because the settings are spread across several views, I needed a place to coordinate the saving and initialization and other things for all of the settings in one place.  So, I added a controller.  The settings controller handles the save button for all of the settings tabs together.  It checks with each one to see if the values have changed and are valid, so that if the user clicks okay on the confirmation dialog, the save can be performed on all settings view models.  That is where the register method comes in.  Accepting any instance of IBaseSettingsViewModel, it can manage a list of all of them.  Without, I might add, any of the individuals knowing about each other.  One of the caveats that must be dealt with when using this setup is that due to the loosely coupled views and view models, and due to the fact that they are all imported using MEF, no one class knows about any of the others.  There wasn’t anywhere to manage all of the separate view models, hence a controller class.  The controller is made aware of the view model only when the view model says “Here I am” by registering.  This maintains the loose coupling.  I could remove any one of the settings views and its view model and the module would still perform with those that remain.  The controller doesn’t care how many view models register with it and will handle them all the same.  Similarly, I could add a new settings tab view/viewmodel and as long as it implements the base interface and registers with the controller, then what ever settings values it exposes can become part of the validation and saving process when the user hits the save button.</blockquote>
So now we can write tests for the constructor.  We will test that the display name property is set and that the view model registers with the controller.  Makes sense to me anyways…

```cs
[TestClass]
public class VolumeSettingsViewModelTests
{
    private readonly MockServices _mockServices = new MockServices();

    private readonly Mock&lt;ISettingsController&gt; _mockSettingsController = new Mock&lt;ISettingsController&gt;();

    [TestMethod]
    public void TestVolumeSettingsViewModelConstructorInitializesMembers()
    {
        // Arrangements
        _mockSettingsController.SetupAllProperties();

        // Actions
        var cut = new VolumeSettingsViewModel(_mockServices.Aggregator, _mockSettingsController.Object);

        // Assertions
        Assert.IsNotNull(cut);
        Assert.IsFalse(cut.DisplayName.IsNullOrEmpty());
        _mockSettingsController.Verify(c =&gt; c.RegisterSettingsViewModel(cut), Times.Once());
    }
}
```

A couple of things to note here.  The MockServices type is in a separate unit testing common library that holds any custom mocks that are used over multiple unit tests.  MockServices is a mock of all of the application services, including a custom event aggregator mock.  The other services are mocked using <a href="http://larryparkerdotnet.wordpress.com/2012/01/02/introduction-to-unit-testing-with-moq/" target="_blank">Moq</a> which we use at work for all of our mocking needs.  It works well, is easy to use and I can say that I like it very much.  I use mocks of the application services layer so much that I wrote a class that collects them all and creates mocks of them all. Each mocked service is exposed in two ways from the MockServices class.  First as a property of the mock itself, i.e. \_mockServices.DialogServiceMock, which allows me to make setup and verify calls on the mock of IDialogService.  Second as the Object needed for the service for use in passing as a parameter to constructors, etc.  For example, if I needed a mock of the dialog service to construct a view model in a unit test I could pass in \_mockServices.Aggregator.DialogService and that would not pass the mock but rather the .Object property of the mock, which when using Moq is how you get the instance of the type you are mocking.

So we have tested our view model constructor by asserting that it sets a valid string to the DisplayName property and we have tested that it registered itself with the controller by using the Verfiy method on our mock of the controller (line 20).  If a verify call is not successful, a MoqException is thrown which fails the test.

2. What else can we test for?  What else does this view model do?  Well part of the way my settings models work is by registering the properties that are fed by a service, as I explained is accomplished in the BaseSettingViewModel class.  So we can test that this has occurred and is working correctly.

a. We need to setup our mock of the target service that feeds these settings values (in this case it happens to be called ConfigurationService).

b. We need to then change the values of the settings on our view model instance, so that we can…

c. Check that the values were updated on the target service successfully.

Here is the code for that unit test:

```csharp
[TestMethod]
public void TestVolumeSettingsViewModelRegistersPropertiesWithService()
{
// Arrangements
const decimal TestVolumeValue = 20.5M;
_mockServices.ConfigurationServiceMock.SetupProperty(c =&gt; c.MacroMinimumFlushVolume);
_mockServices.ConfigurationServiceMock.SetupProperty(c =&gt; c.MicroMinimumFlushVolume);
_mockServices.ConfigurationServiceMock.SetupProperty(c =&gt; c.ManifoldMinimumFlushVolume);
_mockServices.ConfigurationServiceMock.SetupProperty(c =&gt; c.MacroMinimumPrimeVolume);
_mockServices.ConfigurationServiceMock.SetupProperty(c =&gt; c.MicroMinimumPrimeVolume);
_mockServices.Aggregator.ConfigurationService.MacroMinimumFlushVolume = 0;
_mockServices.Aggregator.ConfigurationService.MicroMinimumFlushVolume = 0;
_mockServices.Aggregator.ConfigurationService.ManifoldMinimumFlushVolume = 0;
_mockServices.Aggregator.ConfigurationService.MacroMinimumPrimeVolume = 0;
_mockServices.Aggregator.ConfigurationService.MicroMinimumPrimeVolume = 0;

// Actions
var cut = new VolumeSettingsViewModel(_mockServices.Aggregator, _mockSettingsController.Object)
{
MacroMinimumFlushVolume = TestVolumeValue,
MicroMinimumFlushVolume = TestVolumeValue,
ManifoldMinimumFlushVolume = TestVolumeValue,
MacroMinimumPrimeVolume = TestVolumeValue,
MicroMinimumPrimeVolume = TestVolumeValue
};
cut.SaveChanges();

// Assertions
Assert.AreEqual(
_mockServices.Aggregator.ConfigurationService.MacroMinimumFlushVolume, cut.MacroMinimumFlushVolume);
Assert.AreEqual(
_mockServices.Aggregator.ConfigurationService.MicroMinimumFlushVolume, cut.MicroMinimumFlushVolume);
Assert.AreEqual(
_mockServices.Aggregator.ConfigurationService.ManifoldMinimumFlushVolume, cut.ManifoldMinimumFlushVolume);
Assert.AreEqual(
_mockServices.Aggregator.ConfigurationService.MacroMinimumPrimeVolume, cut.MacroMinimumPrimeVolume);
Assert.AreEqual(
_mockServices.Aggregator.ConfigurationService.MicroMinimumPrimeVolume, cut.MicroMinimumPrimeVolume);
}
```

This code should be fairly self explanatory, with the exception of maybe the moq specific code, but a quick look at the <a href="https://code.google.com/p/moq/wiki/QuickStart" target="_blank">Moq QuickStart</a> should clear up any confusion.  Basically I have just setup the five properties on the ConfigurationService mock and then set a new value to each, then asserted that new value (set on the view model) on the service property.  Note that the setup for the properties on the ConfigurationService only sets it so that any value set to that property will be returned by the mock.  Kind of like saying, “Okay, setup this property with a get and set".  I also set all of the properties to a default value of 0.

So, now I have tested the underlying functionality of the view model’s link to the configuration service.  What else is there to test?

3. If you remember from the listing of the VolumeSettingsViewModel you might remember that the volume properties have some validation attributes on them, and these happened to be tied to some more functionality from the BaseSettingsViewModel class that sets a HasErrors flag if the validation fails.  So, that should probably be tested too.

a. There is a RangeValidator attribute on each volume property, from the Ent. Lib Validation Block which we use for validation of domain models.

<blockquote>We also use it for validation of applicable view model properties.  There is in fact some builtin wiring that sets up the validation error messages for the user in the xaml as well.  This is done using a custom control template for textboxes.</blockquote>
b. The range validator has an upper bound limit and a lower bound limit.  I need to test both upper and lower, for each of the 5 volume properties.  So ten tests in all, one for each situation, for each property.

Here is the code for those tests:

```cs
[TestMethod]
public void TestVolumeSettingsViewModelValidationLowerRangeMacroFlush()
{
    // Arrangements
    var testVolumeValue = Convert.ToDecimal(Constants.MinMacroFlushRange) - 1;
    SetupConfigurationServiceProperties();

    // Actions
    var cut = new VolumeSettingsViewModel(_mockServices.Aggregator, _mockSettingsController.Object)
        {
            MacroMinimumFlushVolume = testVolumeValue,
        };
    cut.Validate();

    // Assertions
    Assert.IsTrue(cut.HasErrors);
}

[TestMethod]
public void TestVolumeSettingsViewModelValidationLowerRangeMacroPrime()
{
    // Arrangements
    var testVolumeValue = Convert.ToDecimal(Constants.MinMacroPrimeRange) - 1;
    SetupConfigurationServiceProperties();

    // Actions
    var cut = new VolumeSettingsViewModel(_mockServices.Aggregator, _mockSettingsController.Object)
        {
            MacroMinimumPrimeVolume = testVolumeValue,
        };
    cut.Validate();

    // Assertions
    Assert.IsTrue(cut.HasErrors);
}

[TestMethod]
public void TestVolumeSettingsViewModelValidationLowerRangeManifoldFlush()
{
    // Arrangements
    var testVolumeValue = Convert.ToDecimal(Constants.MinManifoldFlushRange) - 1;
    SetupConfigurationServiceProperties();

    // Actions
    var cut = new VolumeSettingsViewModel(_mockServices.Aggregator, _mockSettingsController.Object)
        {
            ManifoldMinimumFlushVolume = testVolumeValue,
        };
    cut.Validate();

    // Assertions
    Assert.IsTrue(cut.HasErrors);
}

[TestMethod]
public void TestVolumeSettingsViewModelValidationLowerRangeMicroFlush()
{
    // Arrangements
    var testVolumeValue = Convert.ToDecimal(Constants.MinMicroFlushRange) - 1;
    SetupConfigurationServiceProperties();

    // Actions
    var cut = new VolumeSettingsViewModel(_mockServices.Aggregator, _mockSettingsController.Object)
        {
            MicroMinimumFlushVolume = testVolumeValue,
        };
    cut.Validate();

    // Assertions
    Assert.IsTrue(cut.HasErrors);
}

[TestMethod]
public void TestVolumeSettingsViewModelValidationLowerRangeMicroPrime()
{
    // Arrangements
    var testVolumeValue = Convert.ToDecimal(Constants.MinMicroPrimeRange) - 1;
    SetupConfigurationServiceProperties();

    // Actions
    var cut = new VolumeSettingsViewModel(_mockServices.Aggregator, _mockSettingsController.Object)
        {
            MicroMinimumPrimeVolume = testVolumeValue,
        };
    cut.Validate();

    // Assertions
    Assert.IsTrue(cut.HasErrors);
}

[TestMethod]
public void TestVolumeSettingsViewModelValidationUpperRangeMacroFlush()
{
    // Arrangements
    var testVolumeValue = Convert.ToDecimal(Constants.MaxMacroFlushRange) + 1;
    SetupConfigurationServiceProperties();

    // Actions
    var cut = new VolumeSettingsViewModel(_mockServices.Aggregator, _mockSettingsController.Object)
        {
            MacroMinimumFlushVolume = testVolumeValue,
        };
    cut.Validate();

    // Assertions
    Assert.IsTrue(cut.HasErrors);
}

[TestMethod]
public void TestVolumeSettingsViewModelValidationUpperRangeMacroPrime()
{
    // Arrangements
    var testVolumeValue = Convert.ToDecimal(Constants.MaxMacroPrimeRange) + 1;
    SetupConfigurationServiceProperties();

    // Actions
    var cut = new VolumeSettingsViewModel(_mockServices.Aggregator, _mockSettingsController.Object)
        {
            MacroMinimumPrimeVolume = testVolumeValue,
        };
    cut.Validate();

    // Assertions
    Assert.IsTrue(cut.HasErrors);
}

[TestMethod]
public void TestVolumeSettingsViewModelValidationUpperRangeManifoldFlush()
{
    // Arrangements
    var testVolumeValue = Convert.ToDecimal(Constants.MaxManifoldFlushRange) + 1;
    SetupConfigurationServiceProperties();

    // Actions
    var cut = new VolumeSettingsViewModel(_mockServices.Aggregator, _mockSettingsController.Object)
        {
            ManifoldMinimumFlushVolume = testVolumeValue,
        };
    cut.Validate();

    // Assertions
    Assert.IsTrue(cut.HasErrors);
}

[TestMethod]
public void TestVolumeSettingsViewModelValidationUpperRangeMicroFlush()
{
    // Arrangements
    var testVolumeValue = Convert.ToDecimal(Constants.MaxMicroFlushRange) + 1;
    SetupConfigurationServiceProperties();

    // Actions
    var cut = new VolumeSettingsViewModel(_mockServices.Aggregator, _mockSettingsController.Object)
        {
            MicroMinimumFlushVolume = testVolumeValue,
        };
    cut.Validate();

    // Assertions
    Assert.IsTrue(cut.HasErrors);
}
```

These tests are all very similar, varying only in which volume property is tested and whether testing the lower limit or the upper.  Each test uses the constant value that is used in the actual RangeValidator and either adds or subtracts 1 to come up with a value that is outside the limits.  Then that invalid value is set to the property on the view model.  The validate method is called and then we assert that the HasErrors flag is correctly set showing the invalid value.

<h3>Summing Up…</h3>
Well, I guess that is a pretty good glimpse at what I went through to get these view models tested.  I just wanted to provide some real world examples into how to come up with what unit tests to write for a view model.  It is something that doesn’t come as easily for me as other unit testing and I have never really found a blow by blow set of examples like what I have hopefully provided here.  In other words, I wish I would have found an article like this when I first started with PRISM and MVVM, that would have helped me with my unit testing.

Certainly nothing earth shattering, and in fact, these examples are pretty simple, but I wanted to convey the through process and the “on the ground” example of some unit testing for view models.  I could go through the rest of the view models but as they are all settings view models, the subsequent test are all very similar, as is the process behind coming up with them.

I hope that this helps someone.  And please offer some feedback if you have experience in this and can offer some insight.  I am still very much looking to improve my unit testing process and technique and all input would be appreciated.
