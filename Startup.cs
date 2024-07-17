using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(loginwawaky.Startup))]
namespace loginwawaky
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
