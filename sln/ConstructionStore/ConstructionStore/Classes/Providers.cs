namespace ConstructionStore
{
    public partial class Providers
    {
        public string FullNameAndCountry => $"{ProviderTypes.Name} \"{Name}\" ({Countries.Name})";
    }
}