import { Construct } from "constructs";
import { App, TerraformStack, CloudBackend, TaggedCloudWorkspaces } from "cdktf";
import { provider } from "@cdktf/provider-azurerm";  // import the Construct from the @cdktf/provider-azurerm package
import { Hashicat } from "./.gen/modules/hashicat";  // import the Construct from the .gen/modules/hashicat package


class MyStack extends TerraformStack {
  constructor(scope: Construct, id: string) {
    super(scope, id);

    // define resources here

    new provider.AzurermProvider(this, "azurerm", {
      features: {
        resourceGroup: {
          preventDeletionIfContainsResources: false,
        }
      }
    });

    new Hashicat(this, "hashicat", {
      prefix: "asbdemo2",}
    );


}
}

const app = new App();
const stack = new MyStack(app, "ent-cdktf-azure");
new CloudBackend(stack, {
  hostname: "app.terraform.io",
  organization: "yulei",
  workspaces: new TaggedCloudWorkspaces(["azure", "hashicat","customerfacing","cdktf"])
});
app.synth();
